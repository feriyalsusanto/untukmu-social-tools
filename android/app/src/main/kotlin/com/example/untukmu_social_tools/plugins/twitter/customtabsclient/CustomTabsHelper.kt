package com.example.untukmu_social_tools.plugins.twitter.customtabsclient

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.text.TextUtils
import android.util.Log

object CustomTabsHelper {
    private const val TAG = "CustomTabsHelper"
    const val STABLE_PACKAGE = "com.android.chrome"
    const val BETA_PACKAGE = "com.chrome.beta"
    const val DEV_PACKAGE = "com.chrome.dev"
    const val LOCAL_PACKAGE = "com.google.android.apps.chrome"

    // HACK: Using a StringBuilder prevents Jetifier from tempering with our constants.
    @Suppress("StringLiteralDuplication")
    private val EXTRA_CUSTOM_TABS_KEEP_ALIVE = StringBuilder("android")
        .append(".support.customtabs.extra.KEEP_ALIVE").toString()

    @Suppress("StringLiteralDuplication")
    private val ACTION_CUSTOM_TABS_CONNECTION = StringBuilder("android")
        .append(".support.customtabs.action.CustomTabsService").toString()

    private var sPackageNameToUse: String? = null

    fun addKeepAliveExtra(context: Context, intent: Intent) {
        val keepAliveIntent = Intent().setClassName(
            context.packageName,
            KeepAliveService::class.java.canonicalName!!
        )
        intent.putExtra(EXTRA_CUSTOM_TABS_KEEP_ALIVE, keepAliveIntent)
    }

    /**
     * Goes through all apps that handle VIEW intents and have a warmup service. Picks
     * the one chosen by the user if there is one, otherwise makes a best effort to return a
     * valid package name.
     *
     * This is **not** threadsafe.
     *
     * @param context [Context] to use for accessing [PackageManager].
     * @return The package name recommended to use for connecting to custom tabs related components.
     */
    fun getPackageNameToUse(context: Context): String? {
        sPackageNameToUse?.let { return it }

        val pm = context.packageManager
        // Get default VIEW intent handler.
        val activityIntent = Intent(Intent.ACTION_VIEW, Uri.parse("http://www.example.com"))
        val defaultViewHandlerInfo = pm.resolveActivity(activityIntent, 0)
        val defaultViewHandlerPackageName = defaultViewHandlerInfo?.activityInfo?.packageName

        // Get all apps that can handle VIEW intents.
        val resolvedActivityList =
            pm.queryIntentActivities(activityIntent, PackageManager.MATCH_ALL)

        val packagesSupportingCustomTabs = mutableListOf<String>()
        for (info in resolvedActivityList) {
            val serviceIntent = Intent().apply {
                action = ACTION_CUSTOM_TABS_CONNECTION
                setPackage(info.activityInfo.packageName)
            }
            if (pm.resolveService(serviceIntent, 0) != null) {
                packagesSupportingCustomTabs.add(info.activityInfo.packageName)
            }
        }

        // Now packagesSupportingCustomTabs contains all apps that can handle both VIEW intents
        // and service calls.
        sPackageNameToUse = when {
            packagesSupportingCustomTabs.isEmpty() -> null
            packagesSupportingCustomTabs.size == 1 -> packagesSupportingCustomTabs[0]
            !TextUtils.isEmpty(defaultViewHandlerPackageName) &&
                    !hasSpecializedHandlerIntents(context, activityIntent) &&
                    packagesSupportingCustomTabs.contains(defaultViewHandlerPackageName) ->
                defaultViewHandlerPackageName
            packagesSupportingCustomTabs.contains(STABLE_PACKAGE) -> STABLE_PACKAGE
            packagesSupportingCustomTabs.contains(BETA_PACKAGE) -> BETA_PACKAGE
            packagesSupportingCustomTabs.contains(DEV_PACKAGE) -> DEV_PACKAGE
            packagesSupportingCustomTabs.contains(LOCAL_PACKAGE) -> LOCAL_PACKAGE
            else -> null
        }

        return sPackageNameToUse
    }

    /**
     * Used to check whether there is a specialized handler for a given intent.
     * @param intent The intent to check with.
     * @return Whether there is a specialized handler for the given intent.
     */
    private fun hasSpecializedHandlerIntents(context: Context, intent: Intent): Boolean {
        return try {
            val pm = context.packageManager
            val handlers = pm.queryIntentActivities(
                intent,
                PackageManager.GET_RESOLVED_FILTER
            )

            if (handlers.isEmpty()) {
                return false
            }

            for (resolveInfo in handlers) {
                val filter = resolveInfo.filter ?: continue
                if (filter.countDataAuthorities() == 0 || filter.countDataPaths() == 0) continue
                if (resolveInfo.activityInfo == null) continue
                return true
            }
            false
        } catch (e: RuntimeException) {
            Log.e(TAG, "Runtime exception while getting specialized handlers")
            false
        }
    }

    /**
     * @return All possible chrome package names that provide custom tabs feature.
     */
    fun getPackages(): Array<String> {
        return arrayOf("", STABLE_PACKAGE, BETA_PACKAGE, DEV_PACKAGE, LOCAL_PACKAGE)
    }
}