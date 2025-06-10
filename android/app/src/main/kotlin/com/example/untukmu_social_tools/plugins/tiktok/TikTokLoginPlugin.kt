package com.example.untukmu_social_tools.plugins.tiktok

import android.app.Activity
import android.content.Intent
import com.tiktok.open.sdk.auth.AuthApi
import com.tiktok.open.sdk.auth.AuthRequest
import com.tiktok.open.sdk.auth.utils.PKCEUtils
import com.tiktok.open.sdk.core.appcheck.TikTokAppCheckUtil
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry

class TikTokLoginPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.NewIntentListener {
    private lateinit var channel : MethodChannel
    private lateinit var authApi: AuthApi

    var activity: Activity? = null
    private var activityPluginBinding: ActivityPluginBinding? = null
    private var loginResult: MethodChannel.Result? = null

    private var clientKey: String? = null
    private var codeVerifier: String = ""
    private var redirectUrl: String = ""

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "com.example.untukmu_social_tools/tiktok_sdk")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        println("TIKTOK SDK || ${call.method}")
        when (call.method) {
            "setup" -> {
                val activity = activity
                if  (activity == null) {
                    result.error(
                        "no_activity_found",
                        "There is no valid Activity found to present TikTok SDK Login screen.",
                        null
                    )
                    return
                }

                clientKey = call.argument<String?>("clientKey")
                authApi = AuthApi(activity = activity)
                result.success(null)
            }
            "login" -> {
                val scope = call.argument<String>("scope")
                val state = call.argument<String>("state")
                redirectUrl = call.argument<String>("redirectUri") ?: ""
                val browserAuthEnabled = call.argument<Boolean>("browserAuthEnabled")

                codeVerifier = PKCEUtils.generateCodeVerifier()

                val request = AuthRequest(
                    clientKey = clientKey ?: "",
                    scope = scope ?: "",
                    redirectUri = redirectUrl,
                    state = state,
                    codeVerifier = codeVerifier,
                )

                val authType = if (browserAuthEnabled == true) {
                    AuthApi.AuthMethod.ChromeTab
                } else {
                    AuthApi.AuthMethod.TikTokApp
                }

                val checked = TikTokAppCheckUtil.getInstalledTikTokApp(activity!!)

                println("TIKTOK SDK | LOGIN || ${request.toString()}, authType: $authType, isAppInstalled: ${checked?.isAppInstalled()}")

                authApi.authorize(request, authType)
                loginResult = result
            }
            else -> result.notImplemented()
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        bindActivityBinding(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        unbindActivityBinding()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        bindActivityBinding(binding)
    }

    override fun onDetachedFromActivity() {
        unbindActivityBinding()
    }

    private fun bindActivityBinding(binding: ActivityPluginBinding) {
        activity = binding.activity
        activityPluginBinding = binding
        binding.addOnNewIntentListener(this);
    }

    private fun unbindActivityBinding() {
        activityPluginBinding?.removeOnNewIntentListener(this)
        activity = null
        activityPluginBinding = null
    }

    override fun onNewIntent(intent: Intent): Boolean {
        authApi.getAuthResponseFromIntent(intent, redirectUrl = redirectUrl)?.let {
            val authCode = it.authCode
            if (authCode.isNotEmpty()) {
                val resultMap = mapOf(
                    "authCode" to authCode,
                    "state" to it.state,
                    "grantedPermissions" to it.grantedPermissions,
                    "codeVerifier" to codeVerifier
                )
                loginResult?.success(resultMap)
            } else {
                // Returns an error if authentication fails
                loginResult?.error(
                    it.errorCode.toString(),
                    it.errorMsg,
                    null,
                )
            }
        }
        return true
    }
}