package com.example.untukmu_social_tools

import com.example.untukmu_social_tools.plugins.tiktok.TikTokLoginPlugin
import com.example.untukmu_social_tools.plugins.twitter.TwitterLoginPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(TikTokLoginPlugin())
        flutterEngine.plugins.add(TwitterLoginPlugin())
    }
}
