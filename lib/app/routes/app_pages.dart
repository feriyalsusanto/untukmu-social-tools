import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/twitter_auth_result.dart';
import 'package:untukmu_social_tools/app/modules/deeplink/deep_link_connect_page.dart';
import 'package:untukmu_social_tools/app/modules/home/bindings/home_bindings.dart';
import 'package:untukmu_social_tools/app/modules/home/views/home_page.dart';
import 'package:untukmu_social_tools/app/modules/landing/views/landing_page.dart';
import 'package:untukmu_social_tools/app/modules/signin/bindings/sign_in_bindings.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/sign_in_page.dart';

class AppPages {
  static const initial = '/';
  static const home = '/home';
  static const deepLink = '/deeplink';
  static const deepLinkConnect = '$deepLink/connect';
  static const signIn = '/auth/signin';

  static List<GetPage> pages = [
    GetPage(name: initial, page: () => const LandingPage()),
    GetPage(name: home, binding: HomeBindings(), page: () => const HomePage()),
    GetPage(
      name: deepLinkConnect,
      page: () {
        String oauthToken = Get.parameters['oauth_token'] ?? '';
        String oauthVerifier = Get.parameters['oauth_verifier'] ?? '';
        return DeepLinkConnectPage(
          oauthToken: oauthToken,
          oauthVerifier: oauthVerifier,
        );
      },
    ),
    GetPage(
      name: signIn,
      page: () {
        Map<String, dynamic>? args = Get.arguments;
        final TwitterAuthResult? twitterAuthResult =
            args?['twitterAuth'] as TwitterAuthResult?;
        return SignInPage(twitterAuthResult: twitterAuthResult);
      },
      binding: SignInBindings(),
    ),
  ];
}
