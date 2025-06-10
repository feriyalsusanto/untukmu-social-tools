import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/controllers/applinks/applinks_controller.dart';
import 'package:untukmu_social_tools/app/controllers/twitter_sdk/twitter_sdk_controller.dart';
import 'package:untukmu_social_tools/app/core/tiktok_sdk/tiktok_sdk_v2.dart';
import 'package:untukmu_social_tools/app/controllers/storage/app_storage_controller.dart';
import 'package:untukmu_social_tools/app/routes/app_pages.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await TikTokSDK.instance.setup(clientKey: dotenv.env['TIKTOK_CLIENT_KEY']!);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Untukmu SMT',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        cardTheme: CardTheme(color: Colors.white, elevation: 4),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      ),
      getPages: AppPages.pages,
      initialBinding: BindingsBuilder(() {
        Get.put(AppStorageController());
        Get.put(ApplinksController());
        Get.put(TwitterSdkController());
      }),
    );
  }
}
