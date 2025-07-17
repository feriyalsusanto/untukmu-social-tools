import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/authentication/email/controllers/email_controller.dart';
import 'package:untukmu_social_tools/app/modules/authentication/widgets/authentication_widget.dart';
import 'package:untukmu_social_tools/app/modules/widgets/widgets.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class AuthEmailPage extends StatefulWidget {
  const AuthEmailPage({super.key});

  @override
  State<AuthEmailPage> createState() => _AuthEmailPageState();
}

class _AuthEmailPageState extends State<AuthEmailPage> {
  final EmailController _emailController = EmailController.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<EmailController>(
        builder: (controller) {
          bool isVerification = controller.state == AuthEmailState.verification;

          return AuthenticationWidget(
            title:
                isVerification
                    ? 'Growth Is Better Together'
                    : 'Define Your Presence',
            subtitle1:
                'Create a Passport that evolves with every signal you leave behind.',
            subtitle2: 'Start shaping your digital story.',
            children:
                controller.state == AuthEmailState.input
                    ? inputEmailWidget()
                    : verificatiomEmailWidget(email: controller.email),
          );
        },
      ),
    );
  }

  List<Widget> inputEmailWidget() {
    return [
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
      Column(
        children: [
          CustomTextInputWidget(
            controller: nameController,
            hintText: 'Name',
            textColor: DLSColors.textWhite0,
            prefixWidget: Container(
              padding: EdgeInsets.all(10.w),
              width: 16.w,
              height: 16.w,
              child: Assets.icons.personFilled.svg(
                colorFilter: ColorFilter.mode(
                  DLSColors.iconSoft400,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          CustomTextInputWidget(
            controller: emailController,
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
          SizedBox(height: 16.h),
          SocialMediaButton(
            label: 'Continue',
            onPressed:
                () => _emailController.continueWithEmail(
                  email: emailController.text,
                  name: nameController.text,
                ),
          ),
        ],
      ),
      SizedBox(height: 32.h),
      Container(
        padding: EdgeInsets.all(DLSSizing.xSmall.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white.withValues(alpha: 0.1),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.25),
            width: 1.w,
          ),
        ),
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
      SizedBox(height: 32.h),
    ];
  }

  List<Widget> verificatiomEmailWidget({String email = ''}) {
    return [
      Assets.icons.sms.svg(
        width: 32.w,
        colorFilter: ColorFilter.mode(DLSColors.iconSoft400, BlendMode.srcIn),
      ),
      SizedBox(height: 8.h),
      Text(
        'Check Your Email',
        style: DLSTextStyle.titleH4.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 16.h),
      Container(
        padding: EdgeInsets.all(DLSSizing.xSmall.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Color(0xFF20232D),
        ),
        child: Column(
          spacing: 2.h,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'We\'ve sent a secure link to ',
                style: DLSTextStyle.paragraphSmall.copyWith(
                  color: DLSColors.textSoft400,
                ),
                children: [
                  TextSpan(
                    text: email.isEmpty ? 'you@example.com' : email,
                    style: DLSTextStyle.paragraphSmall.copyWith(
                      color: DLSColors.textSoft400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Click it to continue setting up your Profile Passport.',
              style: DLSTextStyle.paragraphSmall.copyWith(
                color: DLSColors.textSoft400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      SizedBox(height: 8.h),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Color(0xFF20232D),
        ),
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
              lineColor: Colors.white.withValues(alpha: 0.1),
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
            SizedBox(height: 12.h),
            SocialMediaButton(
              label: 'Resend Link',
              onPressed: () {},
              darkMode: true,
            ),
            SizedBox(height: 12.h),
            SocialMediaButton(
              label: 'Back',
              onPressed:
                  () =>
                      _emailController.updateState(state: AuthEmailState.input),
              buttonType: ButtonType.outline,
              borderColor: Colors.white.withValues(alpha: 0.5),
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
      SizedBox(height: 32.h),
    ];
  }
}
