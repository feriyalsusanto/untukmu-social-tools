import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/twitter_token.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/twitter_user.dart';
import 'package:untukmu_social_tools/app/data/models/user/saved_user.dart';

class AppStorageController extends GetxController {
  static AppStorageController get instance => Get.find();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: 'secure_app_prefs',
      preferencesKeyPrefix: 'secure_',
    ),
    iOptions: IOSOptions(
      groupId: 'group.com.yourcompany.yourapp',
      accountName: 'YourAppKeychain',
      synchronizable: false,
    ),
  );

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<SavedUser?> loadUserData() async {
    try {
      // _isLoading.value = true;

      final savedTwitterToken = await _storage.read(key: 'twitterToken');
      final savedTwitterUser = await _storage.read(key: 'twitterUser');
      final savedTwitterConnectDate = await _storage.read(key: 'twitterConnectDate');

      TwitterToken? twitterToken;
      TwitterUser? twitterUser;
      if (savedTwitterToken != null) {
        twitterToken = TwitterToken.fromJson(jsonDecode(savedTwitterToken));
      }

      if (savedTwitterUser != null) {
        twitterUser = TwitterUser.fromJson(jsonDecode(savedTwitterUser));
      }

      final savedUser = SavedUser(
        twitterToken: twitterToken,
        twitterUser: twitterUser,
        connectDate: savedTwitterConnectDate,
      );

      return savedUser;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user data: $e');
    }

    return null;
  }

  Future<void> saveTwitterData({
    required TwitterToken twitterToken,
    TwitterUser? twitterUser,
  }) async {
    try {
      await _storage.write(
        key: 'twitterToken',
        value: jsonEncode(twitterToken.toJson()),
      );

      if (twitterUser != null) {
        await _storage.write(
          key: 'twitterUser',
          value: jsonEncode(twitterUser.toJson()),
        );
      }

      await _storage.write(
        key: 'twitterConnectDate',
        value: DateTime.now().toIso8601String(),
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to save user data: $e');
    }
  }
}
