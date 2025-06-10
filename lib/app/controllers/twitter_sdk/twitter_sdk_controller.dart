import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/core/twitter_sdk/twitter_login.dart';
import 'package:untukmu_social_tools/app/controllers/storage/app_storage_controller.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/twitter_token.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/twitter_user.dart';

class TwitterSdkController extends GetxController {
  final _appStorageController = AppStorageController.instance;

  TwitterLogin? _twitterLogin;
  bool isLoading = false;

  TwitterToken? twitterToken;
  TwitterUser? twitterUser;
  String? twitterConnectDate;

  @override
  void onInit() {
    super.onInit();
    _twitterLogin = TwitterLogin(
      apiKey: dotenv.env['TWITTER_API_KEY']!,
      apiSecretKey: dotenv.env['TWITTER_API_KEY_SECRET']!,
      clientId: dotenv.env['TWITTER_CLIENT_ID']!,
      clientSecret: dotenv.env['TWITTER_CLIENT_SECRET']!,
      redirectURI: 'untukmusocialtools://connect',
    );
  }

  checkUserLoggedIn() async {
    isLoading = true;
    update();

    await Future.delayed(Duration(seconds: 2));

    var savedUser = await _appStorageController.loadUserData();
    if (savedUser != null) {
      twitterToken = savedUser.twitterToken;
      twitterUser = savedUser.twitterUser;
      twitterConnectDate = savedUser.connectDate;
    }

    isLoading = false;
    update();
  }

  Future<void> login() async {
    isLoading = true;
    update();

    try {
      final authResult = await _twitterLogin!.loginV2();
      switch (authResult.status) {
        case TwitterLoginStatus.loggedIn:
          // success
          String? token = authResult.authToken;
          String? tokenSecret = authResult.authTokenSecret;
          var user = authResult.user;
          debugPrint('====== Login success ======');
          debugPrint('Token: $token');
          debugPrint('Token Secret: $tokenSecret');
          debugPrint(
            'User: ${user?.id}, ${user?.name}, ${user?.screenName}, ${user?.thumbnailImage}',
          );

          twitterToken = TwitterToken(token: token!, tokenSecret: tokenSecret!);
          twitterUser =
              user != null
                  ? TwitterUser(
                    id: user.id,
                    name: user.name,
                    screenName: user.screenName,
                    thumbnailImage: user.thumbnailImage,
                  )
                  : null;

          if (twitterToken == null) {
            debugPrint('====== Login failed ======');
          } else {
            await _appStorageController.saveTwitterData(
              twitterToken: twitterToken!,
              twitterUser: twitterUser,
            );
          }
          break;
        case TwitterLoginStatus.cancelledByUser:
          // cancel
          debugPrint('====== Login cancel ======');
          break;
        case TwitterLoginStatus.error:
        case null:
          // error
          debugPrint('====== Login error ======');
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  reset({bool rebuild = true}) {
    isLoading = false;
    if (rebuild) update();
  }
}
