import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/widgets/text_gradient.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class AuthenticationWidget extends StatelessWidget {
  const AuthenticationWidget({
    super.key,
    required this.title,
    required this.subtitle1,
    required this.children,
    this.onBackPressed,
    this.subtitle2,
  });

  final Function()? onBackPressed;
  final String title;
  final String subtitle1;
  final String? subtitle2;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.backgroundAuthentication.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // Fixed header section
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: kToolbarHeight.h + 16.h,
                  left: 12.w,
                  right: 12.w,
                  bottom: 28.h,
                ),
                child: TextGradient(
                  title,
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.white],
                    begin: Alignment(-1.1, -2),
                    end: Alignment(-1, 2),
                  ),
                  style: CustomTextStyles.interMedium32,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  subtitle1,
                  style: DLSTextStyle.paragraphMedium.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (subtitle2 != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    subtitle2!,
                    style: DLSTextStyle.paragraphMedium.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
          SizedBox(height: 32.h),
          // Flexible modal-like container
          Flexible(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  DLSSizing.xSmall.h,
                  32.h,
                  DLSSizing.xSmall.h,
                  DLSSizing.xSmall.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (onBackPressed != null)
                        Container(
                          margin: EdgeInsets.only(bottom: 16.h),
                          child: GestureDetector(
                            onTap: onBackPressed,
                            child: Row(
                              spacing: 4.w,
                              children: [
                                Icon(
                                  FontAwesomeIcons.chevronLeft,
                                  color: DLSColors.iconSub500,
                                  size: 12.w,
                                ),
                                Text(
                                  'Back',
                                  style: DLSTextStyle.labelSmall.copyWith(
                                    color: DLSColors.textSub500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ...children,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
