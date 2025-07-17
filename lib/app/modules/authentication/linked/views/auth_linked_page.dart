import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/authentication/widgets/authentication_widget.dart';
import 'package:untukmu_social_tools/app/modules/widgets/widgets.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class AuthLinkedPage extends StatefulWidget {
  const AuthLinkedPage({super.key});

  @override
  State<AuthLinkedPage> createState() => _AuthLinkedPageState();
}

class _AuthLinkedPageState extends State<AuthLinkedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationWidget(
        onBackPressed: () {},
        title: 'You\'re Not Just Joining. You\'re Linking Up',
        subtitle1:
            'Create a Passport that evolves with every signal you leave behind.',
        subtitle2: 'Start shaping your digital story.',
        children: [
          Text(
            'You\'re Joining via a Gated Invite',
            style: DLSTextStyle.titleH4.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            'Invited by:',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: Color(0xFF4B5563),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Assets.images.defaultProfilePicture.provider(),
                  ),
                  borderRadius: DLSRadius.radiusFull,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            '@Degenjunno',
            style: DLSTextStyle.labelLarge.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            'Your access is tied to your inviter’s reputation. The stronger your progress, the better your unlocks for both of you.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: Color(0xFF4B5563),
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 32.h),
            padding: EdgeInsets.all(DLSSizing.small.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Color(0xFF20232D),
            ),
            child: Row(
              spacing: 12.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.icons.iconWarningLine.svg(width: 16.w, height: 16.w),
                Expanded(
                  child: Text(
                    'If you break community rules or are banned, your inviter may lose karma or badge access.',
                    style: DLSTextStyle.paragraphSmall.copyWith(
                      color: DLSColors.textSoft400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SocialMediaButton(
            label: 'Continue',
            onPressed: () {},
            darkMode: true,
            backgroundColor: DLSColors.bgSurface700,
            buttonRadius: ButtonRadius.full,
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
