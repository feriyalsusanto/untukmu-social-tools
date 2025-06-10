package com.example.untukmu_social_tools.plugins.twitter.chrome_custom_tabs

import android.content.Intent
import android.os.Bundle
import com.example.untukmu_social_tools.plugins.twitter.TwitterLoginPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

class ChromeSafariBrowserManager(var plugin: TwitterLoginPlugin?) : MethodChannel.MethodCallHandler {
    private val channel: MethodChannel = MethodChannel(plugin!!.messenger!!, "twitter_login/auth_browser")
    private val id: String = UUID.randomUUID().toString()

    init {
        channel.setMethodCallHandler(this)
        shared[id] = this
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "open" -> {
                val id = call.argument<String>("id")
                val url = call.argument<String>("url")

                if (id == null || url == null) {
                    result.error("INVALID_ARGUMENTS", "ID and URL are required", null)
                    return
                }

                open(id, url, result)
            }
            "isAvailable" -> {
                val activity = plugin?.pluginActivity
                if (activity != null) {
                    result.success(CustomTabActivityHelper.isAvailable(activity))
                } else {
                    result.success(false)
                }
            }
            else -> result.notImplemented()
        }
    }

    private fun open(id: String, url: String, result: MethodChannel.Result) {
        val activity = plugin?.pluginActivity

        if (activity == null) {
            result.error("NO_ACTIVITY", "Plugin activity is not available", null)
            return
        }

        if (!CustomTabActivityHelper.isAvailable(activity)) {
            result.success(false)
            return
        }

        val intent = Intent(activity, ChromeCustomTabsActivity::class.java).apply {
            putExtras(Bundle().apply {
                putString("url", url)
                putString("id", id)
                putString("managerId", this@ChromeSafariBrowserManager.id)
            })
        }

        try {
            activity.startActivity(intent)
            result.success(true)
        } catch (e: Exception) {
            result.error("ACTIVITY_START_ERROR", "Failed to start Chrome Custom Tabs activity", e.message)
        }
    }

    fun dispose() {
        channel.setMethodCallHandler(null)
        shared.remove(id)
        plugin = null
    }

    companion object {
        val shared: MutableMap<String, ChromeSafariBrowserManager> = ConcurrentHashMap()

        fun getManager(id: String): ChromeSafariBrowserManager? = shared[id]

        fun getAllManagers(): Collection<ChromeSafariBrowserManager> = shared.values
    }
}