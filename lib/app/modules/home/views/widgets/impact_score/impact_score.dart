import 'package:blur/blur.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/impact_score/impact_score_breakdown.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class ImpactScore extends StatelessWidget {
  const ImpactScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 12.h),
            padding: EdgeInsets.symmetric(
              horizontal: DLSSizing.xSmall.w,
              vertical: DLSSizing.s2xSmall.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              image: DecorationImage(
                image: Assets.images.backgroundImpactScore.provider(),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Stack(
              children: [
                ImpactScoreBreakdown(),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 0.65.sw,
                    height: 0.65.sw,
                    child: Stack(
                      children: [
                        // Layer 1
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    DLSSizing.radiusFull,
                                  ),
                                ),
                              ).blurred(
                                blurColor: Colors.transparent,
                                colorOpacity: 0,
                                borderRadius: BorderRadius.circular(
                                  DLSSizing.radiusFull,
                                ),
                                blur: 14,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    DLSSizing.radiusFull,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withValues(alpha: 0.15),
                                      Colors.black.withValues(alpha: 0.0075),
                                    ],
                                    begin: Alignment(0, -1),
                                    end: Alignment(0, 0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                      blurRadius: 7,
                                      offset: Offset(0, 7),
                                      inset: true,
                                    ),
                                  ],
                                  border: GradientBoxBorder(
                                    width: 1.75,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withValues(alpha: 0.1),
                                        Colors.black.withValues(alpha: 0.05),
                                      ],
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Layer 2
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.all(28.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                DLSSizing.radiusFull,
                              ),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.25),
                                width: 0.88,
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.0, 0.6333],
                                colors: [
                                  Colors.white.withValues(alpha: 0.0),
                                  Color(0xFFE896FE).withValues(alpha: 0.15),
                                ],
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DLSSizing.radiusFull,
                                ),
                              ),
                            ).blurred(
                              blurColor: Colors.transparent,
                              colorOpacity: 0,
                              borderRadius: BorderRadius.circular(
                                DLSSizing.radiusFull,
                              ),
                              blur: 105,
                            ),
                          ),
                        ),
                        // Layer 3
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(45.5.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    DLSSizing.radiusFull,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.4,
                                      ),
                                      blurRadius: 70,
                                      offset: Offset(56, 63),
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                      blurRadius: 6.21,
                                      offset: Offset(5.25, 3.5),
                                      inset: true,
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 10.5,
                                      offset: Offset(-3.5, -3.5),
                                      inset: true,
                                    ),
                                    BoxShadow(
                                      color: Color(0xFF978DED),
                                      blurRadius: 28,
                                      offset: Offset(-7, -7),
                                      inset: true,
                                    ),
                                  ],
                                  gradient: RadialGradient(
                                    center: Alignment(-0.695, -0.58),
                                    radius: 0.62,
                                    colors: [
                                      Color(0xFFB444CA),
                                      Color(0xFF450B80),
                                    ],
                                  ),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.25),
                                    width: 3.5,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8.w),
                                child: Assets.images.metallicBall.image(
                                  opacity: const AlwaysStoppedAnimation(.15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Layer 4
                        Padding(
                          padding: EdgeInsets.all(45.5.w),
                          child: Center(
                            child: Assets.images.imgImpactScoreGlare.image(),
                          ),
                        ),
                        // Layer 5
                        Padding(
                          padding: EdgeInsets.all(65.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Impact Score',
                                style: DLSTextStyle.labelMedium.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '688',
                                style: DLSTextStyle.titleH1.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                      2.w,
                                      2.w,
                                      6.w,
                                      2.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        DLSSizing.radiusFull,
                                      ),
                                      border: Border.all(
                                        color: Color(0xFFA0CDA0),
                                        width: 0.88,
                                      ),
                                    ),
                                    child: Row(
                                      spacing: 7.w,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.circleArrowUp,
                                          size: 12.w,
                                          color: Color(0xFFA0CDA0),
                                        ),
                                        Text(
                                          '+3.6%',
                                          style: DLSTextStyle.labelMedium
                                              .copyWith(
                                                color: Color(0xFFA0CDA0),
                                                fontSize: 6.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
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
                  ),
                ),
              ],
            ),
          ),
          // Layer 5
          Container(
            margin: EdgeInsets.only(top: 6.h),
            child: Align(
              alignment: Alignment(-0.25, 0),
              child: Transform.rotate(
                angle: 0.05,
                child: Assets.images.chromeStarLine.image(height: 0.4.sw),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
