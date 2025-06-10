package com.example.untukmu_social_tools.plugins.twitter

import android.app.Activity
import android.content.Intent
import com.example.untukmu_social_tools.plugins.twitter.chrome_custom_tabs.ChromeSafariBrowserManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class TwitterLoginPlugin: FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware,
    PluginRegistry.NewIntentListener {
    companion object {
        private const val CHANNEL = "twitter_login"
        private const val EVENT_CHANNEL = "twitter_login/event"
    }

    private var methodChannel: MethodChannel? = null
    private var eventChannel: EventChannel? = null
    private var eventSink: EventChannel.EventSink? = null
    private var activityPluginBinding: ActivityPluginBinding? = null
    private var scheme: String? = ""
    private var chromeCustomTabManager: ChromeSafariBrowserManager? = null
    var messenger: BinaryMessenger? = null
    var pluginActivity: Activity? = null

    private fun onAttachedToEngineCustom(messenger: BinaryMessenger) {
        this.messenger = messenger

        chromeCustomTabManager = ChromeSafariBrowserManager(this)
        methodChannel = MethodChannel(messenger, CHANNEL)
        methodChannel!!.setMethodCallHandler(this)

        eventChannel = EventChannel(messenger, EVENT_CHANNEL)
        eventChannel!!.setStreamHandler(object : StreamHandler {
            override fun onListen(arguments: Any?, events: EventSink?) {
                eventSink = events!!
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
            }
        })
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        onAttachedToEngineCustom(binding.binaryMessenger)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        chromeCustomTabManager!!.dispose()
        chromeCustomTabManager = null

        methodChannel!!.setMethodCallHandler(null)
        methodChannel = null

        eventChannel!!.setStreamHandler(null)
        eventChannel = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setScheme" -> {
                scheme = call.arguments as String
                result.success(null)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityPluginBinding = binding
        this.pluginActivity = binding.activity
        binding.addOnNewIntentListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityPluginBinding?.removeOnNewIntentListener(this)
        activityPluginBinding = null
        pluginActivity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activityPluginBinding = binding
        pluginActivity = binding.activity
        binding.addOnNewIntentListener(this)
    }

    override fun onDetachedFromActivity() {
        activityPluginBinding?.removeOnNewIntentListener(this)
        activityPluginBinding = null
        pluginActivity = null
    }

    override fun onNewIntent(intent: Intent): Boolean {
        if (scheme == intent.data?.scheme) {
            eventSink?.success(mapOf("type" to "url", "url" to intent.data?.toString()))
            return true
        }

        return false
    }
}