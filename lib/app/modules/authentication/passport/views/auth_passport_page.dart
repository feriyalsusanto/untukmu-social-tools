import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/authentication/passport/controllers/passport_controller.dart';
import 'package:untukmu_social_tools/app/modules/authentication/widgets/authentication_widget.dart';
import 'package:untukmu_social_tools/app/modules/widgets/widgets.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class AuthPassportPage extends StatefulWidget {
  const AuthPassportPage({super.key});

  @override
  State<AuthPassportPage> createState() => _AuthPassportPageState();
}

class _AuthPassportPageState extends State<AuthPassportPage> {
  final PassportController _passportController = PassportController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationWidget(
        title: 'Define Your Presence',
        subtitle1:
            'Create a Passport that evolves with every signal you leave behind.',
        subtitle2: 'Start shaping your digital story.',
        children: [
          Text(
            'Access Your Profile Passport',
            style: DLSTextStyle.titleH4.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'Track your influence, unlock badges, and get matched with real opportunities.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: DLSColors.textSub500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          SocialMediaButton(
            label: 'Continue with X',
            onPressed: () => _passportController.continueWithX(),
            assetName: Assets.icons.xTwitter.keyName,
            backgroundColor: DLSColors.bgSurface700,
            foregroundColor: DLSColors.bgWhite0,
            iconBackgroundColor: DLSColors.bgStrong900,
            darkMode: true,
          ),
          SizedBox(height: 12.h),
          SocialMediaButton(
            label: 'Continue with Email',
            onPressed: () => _passportController.continueWithEmail(),
            assetName: Assets.icons.sms.keyName,
            backgroundColor: DLSColors.bgSurface700,
            foregroundColor: DLSColors.bgWhite0,
            iconBackgroundColor: DLSColors.bgStrong900,
            darkMode: true,
          ),
          SizedBox(height: 32.h),
          Container(
            padding: EdgeInsets.all(DLSSizing.s2xSmall.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              color: Colors.white.withValues(alpha: 0.1),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.25),
                width: 1.w,
              ),
            ),
            child: Column(
              spacing: 4,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: DLSSizing.xSmall,
                    horizontal: DLSSizing.medium,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(DLSSizing.radius16),
                    color: DLSColors.bgSurface700,
                  ),
                  child: Text(
                    'Each method creates a lightweight Passport shell with a uid, and allows you to explore a demo version immediately.',
                    style: DLSTextStyle.paragraphSmall.copyWith(
                      color: DLSColors.textSub500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: DLSSizing.xSmall.h),
                  child: Column(
                    spacing: 2.h,
                    children: [
                      Text(
                        'By continuing, you agree to our',
                        style: DLSTextStyle.paragraphSmall.copyWith(
                          color: DLSColors.textSub500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: DLSTextStyle.paragraphSmall.copyWith(
                            color: DLSColors.textSub500,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms of Service',
                              style: DLSTextStyle.paragraphSmall.copyWith(
                                color: DLSColors.textSoft400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: DLSTextStyle.paragraphSmall.copyWith(
                                color: DLSColors.textSoft400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
