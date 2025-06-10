package com.example.untukmu_social_tools.plugins.twitter.chrome_custom_tabs

import android.app.Activity
import android.net.Uri
import android.os.Bundle
import androidx.browser.customtabs.CustomTabsCallback
import androidx.browser.customtabs.CustomTabsClient
import androidx.browser.customtabs.CustomTabsIntent
import androidx.browser.customtabs.CustomTabsServiceConnection
import androidx.browser.customtabs.CustomTabsSession
import com.example.untukmu_social_tools.plugins.twitter.customtabsclient.CustomTabsHelper
import com.example.untukmu_social_tools.plugins.twitter.customtabsclient.CustomTabsHelper.getPackageNameToUse
import com.example.untukmu_social_tools.plugins.twitter.customtabsclient.ServiceConnection
import com.example.untukmu_social_tools.plugins.twitter.customtabsclient.ServiceConnectionCallback

class CustomTabActivityHelper: ServiceConnectionCallback {
    private var mCustomTabsSession: CustomTabsSession? = null
    private var mClient: CustomTabsClient? = null
    private var mConnection: CustomTabsServiceConnection? = null
    private var mConnectionCallback: ConnectionCallback? = null
    private var mCustomTabsCallback: CustomTabsCallback? = null

    fun unbindCustomTabsService(activity: Activity?) {
        if (mConnection == null) return
        activity?.unbindService(mConnection!!)
        mClient = null
        mCustomTabsSession = null
        mConnection = null
    }

    fun getSession(): CustomTabsSession? {
        if (mClient == null) {
            mCustomTabsSession = null;
        } else if (mCustomTabsSession == null) {
            mCustomTabsSession = mClient!!.newSession(mCustomTabsCallback);
        }
        return mCustomTabsSession;
    }

    fun setConnectionCallback(connectionCallback: ConnectionCallback) {
        this.mConnectionCallback = connectionCallback
    }

    fun setCustomTabsCallback(customTabsCallback: CustomTabsCallback?) {
        this.mCustomTabsCallback = customTabsCallback
    }

    fun bindCustomTabsService(activity: Activity?) {
        if (mClient != null) return

        val packageName = getPackageNameToUse(activity!!) ?: return

        mConnection = ServiceConnection(this)
        CustomTabsClient.bindCustomTabsService(activity, packageName, mConnection!!)
    }

    fun mayLaunchUrl(uri: Uri?, extras: Bundle?, otherLikelyBundles: List<Bundle?>?): Boolean {
        if (mClient == null) return false

        val session = getSession() ?: return false

        return session.mayLaunchUrl(uri, extras, otherLikelyBundles)
    }

    override fun onServiceConnected(client: CustomTabsClient) {
        mClient = client;
        mClient?.warmup(0L);
        if (mConnectionCallback != null) mConnectionCallback?.onCustomTabsConnected();
    }

    override fun onServiceDisconnected() {
        mClient = null;
        mCustomTabsSession = null;
        if (mConnectionCallback != null) mConnectionCallback?.onCustomTabsDisconnected();
    }

    interface ConnectionCallback {
        /**
         * Called when the service is connected.
         */
        fun onCustomTabsConnected()

        /**
         * Called when the service is disconnected.
         */
        fun onCustomTabsDisconnected()
    }

    companion object {
        fun isAvailable(activity: Activity?): Boolean {
            return activity?.let { CustomTabsHelper.getPackageNameToUse(it) } != null
        }

        fun openCustomTab(
            activity: Activity,
            customTabsIntent: CustomTabsIntent,
            uri: Uri?,
            requestCode: Int
        ) {
            customTabsIntent.intent.setData(uri)
            activity.startActivityForResult(customTabsIntent.intent, requestCode)
        }
    }
}