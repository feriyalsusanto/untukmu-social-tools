import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/social_media_auth_result.dart';
import 'package:untukmu_social_tools/app/modules/authentication/analysis/views/auth_analysis_page.dart';
import 'package:untukmu_social_tools/app/modules/authentication/email/bindings/auth_email_bindings.dart';
import 'package:untukmu_social_tools/app/modules/authentication/email/views/auth_email_page.dart';
import 'package:untukmu_social_tools/app/modules/authentication/invitation/views/auth_invitation_page.dart';
import 'package:untukmu_social_tools/app/modules/authentication/linked/views/auth_linked_page.dart';
import 'package:untukmu_social_tools/app/modules/authentication/passport/bindings/auth_passport_bindings.dart';
import 'package:untukmu_social_tools/app/modules/authentication/passport/views/auth_passport_page.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/bindings/auth_profile_binding.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/views/auth_profile_page.dart';
import 'package:untukmu_social_tools/app/modules/authentication/waitlist/bindings/waitlist_binding.dart';
import 'package:untukmu_social_tools/app/modules/authentication/waitlist/views/auth_waitlist_page.dart';
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

  static const authPassport = '/auth/passport';
  static const authEmail = '/auth/email';
  static const authInvitation = '/auth/invitation';
  static const authWaitlist = '/auth/waitlist';
  static const authLinked = '/auth/linked';
  static const authAnalysis = '/auth/analysis';
  static const authProfile = '/auth/profile';

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
        final SocialMediaAuthResult? socialMediaAuthResult =
            args?['userToken'] as SocialMediaAuthResult?;
        final String? emailKey = args?['emailKey'] as String?;
        return SignInPage(
          socialMediaAuthResult: socialMediaAuthResult,
          emailKey: emailKey,
        );
      },
      binding: SignInBindings(),
    ),
    GetPage(
      name: authPassport,
      binding: AuthPassportBindings(),
      page: () => const AuthPassportPage(),
    ),
    GetPage(
      name: authEmail,
      binding: AuthEmailBindings(),
      page: () => const AuthEmailPage(),
    ),
    GetPage(
      name: authInvitation,
      // binding: AuthInvitationBindings(),
      page: () => const AuthInvitationPage(),
    ),
    GetPage(
      name: authWaitlist,
      binding: AuthWaitlistBinding(),
      page: () => const AuthWaitlistPage(),
    ),
    GetPage(
      name: authLinked,
      // binding: AuthLinkedBinding(),
      page: () => const AuthLinkedPage(),
    ),
    GetPage(
      name: authAnalysis,
      // binding: AuthAnalysisBinding(),
      page: () => const AuthAnalysisPage(),
    ),
    GetPage(
      name: authProfile,
      binding: AuthProfileBinding(),
      page: () => const AuthProfilePage(),
    ),
  ];
}
