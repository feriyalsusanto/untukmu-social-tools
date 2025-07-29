import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/signin/controllers/sign_in_controller.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/widgets.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class InputEmailContent extends StatelessWidget {
  InputEmailContent({super.key});

  final SignInController _signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return SignInContent(
      topContent: Column(
        spacing: 16,
        children: [
          Text('Access Your Profile Passport', style: DLSTextStyle.titleH4),
          Text(
            'Sign up to unlock your social reputation, mint badges, and get matched with real Web3 opportunities.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: DLSColors.textSub500,
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            spacing: 4.h,
            children: [
              CustomTextInputWidget(
                controller: _signInController.nameController,
                hintText: 'Name',
                prefixWidget: Icon(
                  Icons.person,
                  size: 18.w,
                  color: DLSColors.iconSoft400,
                ),
              ),
              CustomTextInputWidget(
                controller: _signInController.emailController,
                hintText: 'Input Your Email',
                prefixWidget: Icon(
                  Icons.email,
                  size: 18.w,
                  color: DLSColors.iconSoft400,
                ),
              ),
            ],
          ),
          SocialMediaButton(
            label: 'Continue',
            onPressed: () {
              _signInController.signUpByEmail(
                email: _signInController.emailController.text,
                name: _signInController.nameController.text,
              );
            },
            darkMode: true,
          ),
        ],
      ),
      bottomContent: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: DLSSizing.s3xSmall,
          horizontal: DLSSizing.xSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: DLSSizing.xSmall,
                horizontal: DLSSizing.medium,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DLSSizing.radius16),
                color: DLSColors.bgWeak100,
              ),
              child: Row(
                spacing: 8.w,
                children: [
                  Assets.icons.layer.svg(),
                  Expanded(
                    child: Text(
                      'By signing up, you agree to our Terms and Privacy Policy.',
                      style: DLSTextStyle.paragraphSmall.copyWith(
                        color: DLSColors.textSoft400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
