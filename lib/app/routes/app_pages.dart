import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/modules/deeplink/deep_link_connect_page.dart';
import 'package:untukmu_social_tools/app/modules/home/views/home_page.dart';
import 'package:untukmu_social_tools/app/modules/landing/views/landing_page.dart';

class AppPages {
  static const initial = '/';
  static const home = '/home';
  static const deepLink = '/deeplink';
  static const deepLinkConnect = '$deepLink/connect';

  static List<GetPage> pages = [
    GetPage(name: initial, page: () => const LandingPage()),
    GetPage(name: home, page: () => const HomePage()),
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
  ];
}
