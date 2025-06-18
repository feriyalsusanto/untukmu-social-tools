import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/widgets.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class CheckEmailContent extends StatelessWidget {
  const CheckEmailContent({super.key, required this.onBackTap});

  final Function() onBackTap;

  @override
  Widget build(BuildContext context) {
    return SignInContent(
      topContent: Column(
        spacing: 16,
        children: [
          Assets.icons.sms.svg(
            colorFilter: ColorFilter.mode(
              DLSColors.primaryBase,
              BlendMode.srcIn,
            ),
            width: 54,
          ),
          Text('Check Your Email', style: DLSTextStyle.titleH4),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: DLSSizing.xSmall,
              horizontal: DLSSizing.xSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DLSSizing.radius16),
              color: DLSColors.bgWeak100,
            ),
            child: Column(
              spacing: 2,
              children: [
                RichText(
                  text: TextSpan(
                    style: DLSTextStyle.paragraphSmall.copyWith(
                      color: DLSColors.textSoft400,
                    ),
                    children: [
                      TextSpan(text: 'We\'ve sent a secure link to '),
                      TextSpan(
                        text: 'you@example.com',
                        style: DLSTextStyle.paragraphSmall.copyWith(
                          fontWeight: FontWeight.w700,
                          color: DLSColors.textSoft400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  text: TextSpan(
                    style: DLSTextStyle.paragraphSmall.copyWith(
                      color: DLSColors.textSoft400,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Click it to continue setting up your Profile Passport.',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
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
            Text(
              'Didn\'t receive it?',
              style: DLSTextStyle.paragraphSmall.copyWith(
                color: DLSColors.textWhite0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2),
            Text(
              'Check your spam or promotions folder',
              style: DLSTextStyle.paragraphSmall.copyWith(
                color: DLSColors.textWhite0,
              ),
              textAlign: TextAlign.center,
            ),
            CustomDividerWidget(
              centerWidget: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'OR',
                  style: DLSTextStyle.subheadingXSmall.copyWith(
                    color: DLSColors.textWhite0,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: DLSColors.bgWhite0.withValues(alpha: 0.25),
                foregroundColor: DLSColors.bgWhite0,
                elevation: 0,
                padding: EdgeInsets.all(DLSSizing.xSmall),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DLSSizing.radius16),
                  side: BorderSide(
                    color: DLSColors.strokeWhite0.withValues(alpha: 0.25),
                    width: 1,
                  ),
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Resend Link',
                style: DLSTextStyle.labelLarge.copyWith(
                  color: DLSColors.textWhite0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: onBackTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: DLSColors.bgWhite0,
                elevation: 0,
                padding: EdgeInsets.all(DLSSizing.xSmall),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DLSSizing.radius16),
                  side: BorderSide(
                    color: DLSColors.strokeWhite0.withValues(alpha: 0.25),
                    width: 1,
                  ),
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Back',
                style: DLSTextStyle.labelLarge.copyWith(
                  color: DLSColors.textWhite0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
