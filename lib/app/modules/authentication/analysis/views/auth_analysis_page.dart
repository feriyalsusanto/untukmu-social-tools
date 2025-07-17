import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/authentication/widgets/authentication_widget.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class AuthAnalysisPage extends StatefulWidget {
  const AuthAnalysisPage({super.key});

  @override
  State<AuthAnalysisPage> createState() => _AuthAnalysisPageState();
}

class _AuthAnalysisPageState extends State<AuthAnalysisPage> {
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
            'Reading the Signals, Writing Your Story',
            style: DLSTextStyle.titleH4.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'We\'re building your Profile Passport now.',
            style: DLSTextStyle.paragraphMedium.copyWith(
              color: DLSColors.textSub500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'We\'re finding patterns, uncovering traits, and generating your profile.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: DLSColors.textSoft400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          Assets.images.signalsLoading.image(height: 0.4.sw),
          SizedBox(height: 24.h),
          Text(
            'Data analysis in progress. This usually takes less than 30 seconds.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: DLSColors.textSoft400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
