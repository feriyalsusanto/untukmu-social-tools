import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/social_media_auth_result.dart';
import 'package:untukmu_social_tools/app/modules/signin/controllers/sign_in_controller.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/contents/email/input_email_content.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/widgets.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, this.socialMediaAuthResult, this.emailKey});

  final SocialMediaAuthResult? socialMediaAuthResult;
  final String? emailKey;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInController signInController = Get.find();

  @override
  void initState() {
    signInController.initialization(
      socialMediaAuthResult: widget.socialMediaAuthResult,
      emailKey: widget.emailKey,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.backgroundLogin.provider(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Radial gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.75),
                ],
                stops: [0.5, 1.0],
              ),
            ),
          ),
          GetBuilder<SignInController>(
            builder: (controller) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Center(
                  child: SingleChildScrollView(child: getContent()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget getContent() {
    switch (signInController.currentIndex) {
      case 0:
        return PassportContent(
          onSocialMediaTap: (type) {
            if (type == SocialType.x) {
              signInController.loginByX();
            } else if (type == SocialType.google) {
              signInController.loginByGoogle();
            } else if (type == SocialType.email) {
              signInController.switchContent(1);
            }
          },
        );
      case 1:
        return InputEmailContent();
      case 2:
        return CheckEmailContent(
          emailKey: widget.emailKey,
          onBackTap: () {
            signInController.switchContent(3);
          },
        );
      case 3:
        return TwitterConnectContent(
          socialMediaAuthResult: widget.socialMediaAuthResult,
          onSkipPressed: () {
            signInController.switchContent(4);
          },
        );
      case 4:
        return WalletConnectContent(
          onSkipPressed: () {
            signInController.switchContent(5);
          },
        );
      case 5:
        return SummaryContent();
      default:
        return const SizedBox();
    }
  }
}
