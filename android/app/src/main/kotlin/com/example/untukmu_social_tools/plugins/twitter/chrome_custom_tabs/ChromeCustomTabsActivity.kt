package com.example.untukmu_social_tools.plugins.twitter.chrome_custom_tabs

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.browser.customtabs.CustomTabsIntent
import androidx.browser.customtabs.CustomTabsSession
import com.example.untukmu_social_tools.R
import com.example.untukmu_social_tools.plugins.twitter.customtabsclient.CustomTabsHelper
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class ChromeCustomTabsActivity: Activity(), MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private var id: String? = null
    private var builder: CustomTabsIntent.Builder? = null
    private lateinit var helper: CustomTabActivityHelper
    private var session: CustomTabsSession? = null
    private var manager: ChromeSafariBrowserManager? = null

    companion object {
        private const val CHROME_CUSTOM_TAB_REQUEST_CODE = 0
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.chrome_custom_tab)

        val bundle = intent.extras ?: run {
            finish()
            return
        }

        val managerId = bundle.getString("managerId") ?: run {
            finish()
            return
        }

        manager = ChromeSafariBrowserManager.getManager(managerId) ?: run {
            finish()
            return
        }

        // Create a methodChannel for each Activity.
        id = bundle.getString("id")
        channel = MethodChannel(manager?.plugin?.messenger!!, "twitter_login/auth_browser_$id")
        channel.setMethodCallHandler(this)

        val url = bundle.getString("url") ?: run {
            finish()
            return
        }

        helper = CustomTabActivityHelper()
        helper.setConnectionCallback(object : CustomTabActivityHelper.ConnectionCallback {
            override fun onCustomTabsConnected() {
                session = helper.getSession()
                val uri = Uri.parse(url)
                helper.mayLaunchUrl(uri, null, null)

                builder = CustomTabsIntent.Builder(session)
                val customTabsIntent = builder?.build() ?: return

                prepareCustomTabsIntent(customTabsIntent)
                CustomTabActivityHelper.openCustomTab(
                    this@ChromeCustomTabsActivity,
                    customTabsIntent,
                    uri,
                    CHROME_CUSTOM_TAB_REQUEST_CODE
                )
            }

            override fun onCustomTabsDisconnected() {
                close()
                dispose()
            }
        })
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        TODO("Not yet implemented")
    }

    private fun prepareCustomTabsIntent(customTabsIntent: CustomTabsIntent) {
        customTabsIntent.intent.setPackage(CustomTabsHelper.getPackageNameToUse(this))
        CustomTabsHelper.addKeepAliveExtra(this, customTabsIntent.intent)
    }

    override fun onStart() {
        super.onStart()
        helper.bindCustomTabsService(this)
    }

    override fun onStop() {
        super.onStop()
        helper.unbindCustomTabsService(this)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == CHROME_CUSTOM_TAB_REQUEST_CODE) {
            close()
            dispose()
        }
    }

    private fun dispose() {
        channel.setMethodCallHandler(null)
        manager = null
    }

    private fun close() {
        session = null
        finish()
        val obj = mapOf<String, Any>()
        channel.invokeMethod("onClose", obj)
    }
}