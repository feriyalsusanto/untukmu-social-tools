import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/authentication/waitlist/controllers/waitlist_controller.dart';
import 'package:untukmu_social_tools/app/modules/authentication/widgets/authentication_widget.dart';
import 'package:untukmu_social_tools/app/modules/widgets/social_media_button.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class AuthWaitlistPage extends StatefulWidget {
  const AuthWaitlistPage({super.key});

  @override
  State<AuthWaitlistPage> createState() => _AuthWaitlistPageState();
}

class _AuthWaitlistPageState extends State<AuthWaitlistPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WaitlistController>(
      builder: (controller) {
        final state = controller.state;

        return Scaffold(
          body: AuthenticationWidget(
            onBackPressed: () {},
            title: 'Growth Is Better Together',
            subtitle1:
                'Create a Passport that evolves with every signal you leave behind.',
            subtitle2: 'Start shaping your digital story.',
            children:
                state == WaitlistState.joining
                    ? _buildJoiningView(controller)
                    : _buildJoinedView(controller),
          ),
        );
      },
    );
  }

  List<Widget> _buildJoiningView(WaitlistController controller) {
    return [
      Text(
        'You\'re On the List, We\'ll Let You In Soon',
        style: DLSTextStyle.titleH4.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 8.h),
      Text(
        'Since you joined us through X, we couldn\'t grab your email.\n Add it below so we can notify you when it\'s your turn to unlock your Passport and join the community.',
        style: DLSTextStyle.paragraphSmall.copyWith(
          color: DLSColors.textSub500,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 24.h),
      CustomTextInputWidget(
        controller: TextEditingController(),
        hintText: 'Input Your Email',
        textColor: DLSColors.textWhite0,
        prefixWidget: Container(
          padding: EdgeInsets.all(10.w),
          width: 16.w,
          height: 16.w,
          child: Assets.icons.sms.svg(
            colorFilter: ColorFilter.mode(
              DLSColors.iconSoft400,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      SizedBox(height: 24.h),
      SocialMediaButton(
        label: 'Join the Waitlist',
        onPressed: () {
          controller.setState(state: WaitlistState.joined);
        },
        backgroundColor: DLSColors.bgSurface700,
        foregroundColor: DLSColors.bgWhite0,
        iconBackgroundColor: DLSColors.bgStrong900,
        darkMode: true,
        buttonRadius: ButtonRadius.full,
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 24.h),
        padding: EdgeInsets.symmetric(
          horizontal: DLSSizing.xSmall.w,
          vertical: DLSSizing.small.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Color(0xFF20232D),
        ),
        child: Text(
          'We respect your privacy. Your email will only be used to notify you when your access is ready — no spam, ever.',
          style: DLSTextStyle.paragraphSmall.copyWith(
            color: DLSColors.textWhite0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height: 32.h),
    ];
  }

  List<Widget> _buildJoinedView(WaitlistController controller) {
    return [
      Text(
        'Thanks for Joining the Waitlist!',
        style: DLSTextStyle.titleH4.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 8.h),
      Text(
        'We\'ll email you when it\'s your time to unlock your Passport. In the meantime, here\'s how to stay connected and prepare for launch.',
        style: DLSTextStyle.paragraphSmall.copyWith(
          color: DLSColors.textSub500,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 32.h),
      SocialMediaButton(
        label: 'Explore Our Community',
        onPressed: () {},
        backgroundColor: DLSColors.bgWhite0,
        foregroundColor: DLSColors.textMain900,
        iconBackgroundColor: DLSColors.bgStrong900,
        darkMode: true,
      ),
      SizedBox(height: 16.h),
      SocialMediaButton(
        label: 'I Have The Code',
        onPressed: () {},
        backgroundColor: DLSColors.bgSurface700,
        foregroundColor: DLSColors.bgWhite0,
        iconBackgroundColor: DLSColors.bgStrong900,
        darkMode: true,
        buttonType: ButtonType.outline,
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 24.h),
        padding: EdgeInsets.symmetric(
          horizontal: DLSSizing.xSmall.w,
          vertical: DLSSizing.small.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Color(0xFF20232D),
        ),
        child: Text(
          'We respect your privacy. Your email will only be used to notify you when your access is ready — no spam, ever.',
          style: DLSTextStyle.paragraphSmall.copyWith(
            color: DLSColors.textWhite0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      // Text(
      //   'Don\'t Miss out on our Updates',
      //   style: DLSTextStyle.labelMedium.copyWith(color: Colors.white),
      //   textAlign: TextAlign.center,
      // ),
      // SizedBox(height: 12.h),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   spacing: 24.w,
      //   children: [
      //     CircleAvatar(
      //       radius: 22.r,
      //       backgroundColor: DLSColors.bgSurface700,
      //       child: Assets.icons.iconLogoDiscord.svg(width: 30.w),
      //     ),
      //     CircleAvatar(
      //       radius: 22.r,
      //       backgroundColor: DLSColors.bgSurface700,
      //       child: Assets.icons.iconLogoX.svg(width: 20.w),
      //     ),
      //     CircleAvatar(
      //       radius: 22.r,
      //       backgroundColor: DLSColors.bgSurface700,
      //       child: Assets.icons.iconLogoTelegram.svg(width: 30.w),
      //     ),
      //   ],
      // ),
      SizedBox(height: 32.h),
    ];
  }
}
