import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/user_token.dart';
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

      final savedUserToken = await _storage.read(key: 'userToken');
      final savedUserConnectDate = await _storage.read(key: 'userConnectDate');

      UserToken? userToken;
      if (savedUserToken != null) {
        userToken = UserToken.fromJson(jsonDecode(savedUserToken));
      }

      final savedUser = SavedUser(
        userToken: userToken,
        connectDate: savedUserConnectDate,
      );

      return savedUser;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user data: $e');
    }

    return null;
  }

  Future<void> saveUserToken({required UserToken userToken}) async {
    try {
      await _storage.write(
        key: 'userToken',
        value: jsonEncode(userToken.toJson()),
      );

      await _storage.write(
        key: 'userConnectDate',
        value: DateTime.now().toIso8601String(),
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to save user data: $e');
    }
  }

  Future<void> clearUserData() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      Get.snackbar('Error', 'Failed to clear user data: $e');
    }
  }
}
