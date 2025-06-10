package com.example.untukmu_social_tools.plugins.twitter.customtabsclient

import androidx.browser.customtabs.CustomTabsClient

public interface ServiceConnectionCallback {
    fun onServiceConnected(client: CustomTabsClient)

    fun onServiceDisconnected()
}