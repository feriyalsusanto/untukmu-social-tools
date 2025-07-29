import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/widgets.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

enum SocialType { x, google, email }

class PassportContent extends StatelessWidget {
  const PassportContent({super.key, required this.onSocialMediaTap});

  final Function(SocialType type) onSocialMediaTap;

  @override
  Widget build(BuildContext context) {
    return SignInContent(
      topContent: Column(
        children: [
          Text('Access Your Profile Passport', style: DLSTextStyle.titleH4),
          SizedBox(height: 8),
          Text(
            'Track your influence, unlock badges, and get matched with real opportunities.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: DLSColors.textSub500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          Column(
            spacing: 12,
            children: [
              SocialMediaButton(
                onPressed: () => onSocialMediaTap(SocialType.x),
                assetName: Assets.icons.xTwitter.keyName,
                label: 'Continue with X',
              ),
              SocialMediaButton(
                onPressed: () => onSocialMediaTap(SocialType.google),
                assetName: Assets.icons.google.keyName,
                label: 'Continue with Google',
              ),
              SocialMediaButton(
                onPressed: () => onSocialMediaTap(SocialType.email),
                assetName: Assets.icons.sms.keyName,
                label: 'Continue with Email',
              ),
            ],
          ),
        ],
      ),
      bottomContent: Column(
        spacing: 4,
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
            child: Text(
              'Each method creates a lightweight Passport shell with a uid, and allows you to explore a demo version immediately.',
              style: DLSTextStyle.paragraphSmall.copyWith(
                color: DLSColors.textSoft400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: DLSSizing.xSmall),
            child: Column(
              spacing: 4,
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
    );
  }
}
