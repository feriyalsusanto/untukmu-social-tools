package com.example.untukmu_social_tools.plugins.twitter.customtabsclient

import android.content.ComponentName
import androidx.browser.customtabs.CustomTabsClient
import androidx.browser.customtabs.CustomTabsServiceConnection
import java.lang.ref.WeakReference

class ServiceConnection(connectionCallback: ServiceConnectionCallback) : CustomTabsServiceConnection() {
    private var mConnectionCallback: WeakReference<ServiceConnectionCallback>? = WeakReference(connectionCallback)

    override fun onServiceDisconnected(name: ComponentName?) {
        val connectionCallback = mConnectionCallback!!.get()
        connectionCallback?.onServiceDisconnected()
    }

    override fun onCustomTabsServiceConnected(name: ComponentName, client: CustomTabsClient) {
        val connectionCallback = mConnectionCallback!!.get()
        connectionCallback?.onServiceConnected(client)
    }
}