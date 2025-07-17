import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/authentication/widgets/authentication_widget.dart';
import 'package:untukmu_social_tools/app/modules/widgets/widgets.dart';

class AuthInvitationPage extends StatefulWidget {
  const AuthInvitationPage({super.key});

  @override
  State<AuthInvitationPage> createState() => _AuthInvitationPageState();
}

class _AuthInvitationPageState extends State<AuthInvitationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationWidget(
        onBackPressed: () {},
        title: 'Growth Is Better Together',
        subtitle1:
            'Create a Passport that evolves with every signal you leave behind.',
        subtitle2: 'Start shaping your digital story.',
        children: [
          Text(
            'Enter Your Invitation Code',
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
          CustomTextInputWidget(
            controller: TextEditingController(),
            hintText: 'Input Friends Referral Code',
            textColor: DLSColors.textWhite0,
            backgroundColor: DLSColors.bgStrong900,
            label: 'Referral Code',
          ),
          SizedBox(height: 32.h),
          SocialMediaButton(
            label: 'Continue',
            onPressed: () {},
            backgroundColor: DLSColors.bgSurface700,
            foregroundColor: DLSColors.bgWhite0,
            iconBackgroundColor: DLSColors.bgStrong900,
            darkMode: true,
            buttonRadius: ButtonRadius.full,
          ),
          SizedBox(height: 12.h),
          SocialMediaButton(
            label: 'Skip for Now',
            onPressed: () {},
            backgroundColor: DLSColors.bgSurface700,
            foregroundColor: DLSColors.bgWhite0,
            iconBackgroundColor: DLSColors.bgStrong900,
            darkMode: true,
            buttonType: ButtonType.outline,
            buttonRadius: ButtonRadius.full,
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
