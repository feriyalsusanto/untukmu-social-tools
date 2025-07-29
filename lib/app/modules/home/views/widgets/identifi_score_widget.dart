import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/identifi_score_controller.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class IdentifiScoreWidget extends StatelessWidget {
  const IdentifiScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Assets.images.identifiBackground.image(),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 0.125.sw, top: 0.055.sh),
              width: 0.2.sw,
              height: 0.2.sw,
              child: Column(
                spacing: 3.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '688',
                    style: TextStyle(
                      fontFamily: 'Lufga',
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                      height: 1,
                      letterSpacing: 28 * 0.1,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3.w,
                    children: [
                      Assets.icons.iconArrowUp.svg(width: 14.w),
                      Text(
                        '+3.6%',
                        style: CustomTextStyles.neueMontrealMedium12.copyWith(
                          color: Color(0xFFA0CDA0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 32.w, top: 0.055.sh),
              width: 0.515.sw,
              child: Column(
                spacing: 12.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Identifi Score',
                    style: CustomTextStyles.bricolageMedium24.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: DLSSizing.s2xSmall.w,
                          vertical: DLSSizing.s3xSmall.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.15),
                          borderRadius: DLSRadius.radiusFull,
                        ),
                        child: Row(
                          spacing: 12.w,
                          children: [
                            Text(
                              'Impact Score Breakdown',
                              style: CustomTextStyles.neueMontrealRegular12
                                  .copyWith(color: Colors.white),
                            ),
                            Icon(
                              FontAwesomeIcons.chevronRight,
                              color: Colors.white,
                              size: 8.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
