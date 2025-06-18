import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/widgets.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class TwitterConnectContent extends StatelessWidget {
  TwitterConnectContent({super.key, required this.onSkipPressed});

  final Function() onSkipPressed;

  final TextEditingController referralController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SignInContent(
      topContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Boost Your Profile Passport Accuracy',
            style: DLSTextStyle.titleH4,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Connect your Twitter account to get started.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: DLSColors.textSub500,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            padding: EdgeInsets.all(DLSSizing.s3xSmall),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DLSSizing.radius16),
              color: DLSColors.bgWeak100,
            ),
            child: Column(
              children: [
                ConnectInformation(
                  assetName: Assets.icons.stashQuestion.keyName,
                  description:
                      'Each method creates a lightweight Passport shell with a uid, and allows you to explore a demo version immediately.',
                ),
                ConnectInformation(
                  assetName: Assets.icons.eyeSlash.keyName,
                  description:
                      'Your tweets stay private — we only use metadata and public signals.',
                ),
              ],
            ),
          ),
          Column(
            spacing: 12,
            children: [
              TextField(
                controller: referralController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(DLSSizing.s2xSmall),
                  isDense: true,
                  fillColor: DLSColors.bgWeak100,
                  filled: true,
                  border: inputBorder,
                  errorBorder: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                  disabledBorder: inputBorder,
                  focusedErrorBorder: inputBorder,
                  hintText: 'Referral Code',
                  hintStyle: DLSTextStyle.labelLarge.copyWith(
                    color: DLSColors.textSoft400,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              SocialMediaButton(
                onPressed: () {},
                darkMode: true,
                assetName: Assets.icons.xTwitter.keyName,
                label: 'Continue with X',
              ),
              SocialMediaButton(
                onPressed: onSkipPressed,
                label: 'Skip for Now',
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
              color: Colors.black.withValues(alpha: 0.1),
            ),
            child: Text(
              'Connect your Twitter for the best experience. You can do this anytime from the top menu.',
              style: DLSTextStyle.paragraphSmall.copyWith(
                color: DLSColors.textDisabled300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: DLSSizing.xSmall),
            child: Column(
              spacing: 4,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DLSTextStyle.paragraphSmall.copyWith(
                      color: DLSColors.textDisabled300,
                    ),
                    children: [
                      TextSpan(text: 'We never post without your permission. '),
                      TextSpan(
                        text: 'Learn more',
                        style: DLSTextStyle.paragraphSmall.copyWith(
                          color: DLSColors.bgWhite0,
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

  OutlineInputBorder get inputBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(DLSSizing.radius16),
    borderSide: BorderSide(color: DLSColors.strokeSoft200, width: 1),
  );
}
