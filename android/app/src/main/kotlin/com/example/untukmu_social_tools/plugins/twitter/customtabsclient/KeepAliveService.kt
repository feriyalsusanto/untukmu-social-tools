package com.example.untukmu_social_tools.plugins.twitter.customtabsclient

import android.app.Service
import android.content.Intent
import android.os.Binder
import android.os.IBinder


class KeepAliveService: Service() {
    private val sBinder: Binder = Binder()

    override fun onBind(intent: Intent?): IBinder {
        return sBinder
    }
}