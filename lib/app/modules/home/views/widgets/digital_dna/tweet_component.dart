import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/styles/custom_clippers/curve_top_right_clipper.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class DigitalDNATweetComponent extends StatelessWidget {
  const DigitalDNATweetComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 16.w),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(1.w),
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: DLSRadius.radiusFull,
                ),
                child: ClipRRect(
                  borderRadius: DLSRadius.radiusFull,
                  child: Assets.images.defaultProfilePicture.image(width: 44.w),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 32.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipPath(
                      clipper: CurveTopRightClipper(),
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.r),
                            topRight: Radius.circular(32.r),
                          ),
                        ),
                        child: Row(
                          spacing: 12.w,
                          children: [
                            Column(
                              spacing: 8.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  spacing: 4.w,
                                  children: [
                                    Text(
                                      '@ethanmitchell',
                                      style: DLSTextStyle.labelLarge.copyWith(
                                        color: DLSColors.textMain900,
                                      ),
                                    ),
                                    Assets.images.iconVerified.image(
                                      width: 20.w,
                                    ),
                                  ],
                                ),
                                Text(
                                  'May 15, 2025',
                                  style: DLSTextStyle.labelMedium.copyWith(
                                    color: DLSColors.textMain900.withValues(
                                      alpha: 0.25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              FontAwesomeIcons.ellipsis,
                              color: DLSColors.textMain900.withValues(
                                alpha: 0.25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.r),
              bottomLeft: Radius.circular(32.r),
              bottomRight: Radius.circular(32.r),
            ),
          ),
          child: Column(
            children: [
              Text(
                '      Liquid Restaking Tokens (LRTs): The Next Big Thing in DeFi? A thread on why these could be game changers...',
                style: DLSTextStyle.labelLarge.copyWith(
                  color: DLSColors.textMain900,
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                spacing: 8.w,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(8.w, 8.w, 12.w, 8.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F8FA),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      spacing: 8.w,
                      children: [
                        Assets.icons.eyeSlash.svg(
                          width: 12.w,
                          colorFilter: ColorFilter.mode(
                            Color(0xFF292D32),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          '1,543',
                          style: DLSTextStyle.labelXSmall.copyWith(
                            color: DLSColors.textMain900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.w, 8.w, 12.w, 8.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F8FA),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      spacing: 8.w,
                      children: [
                        Assets.icons.heart.svg(
                          colorFilter: ColorFilter.mode(
                            Color(0xFF292D32),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          '243',
                          style: DLSTextStyle.labelXSmall.copyWith(
                            color: DLSColors.textMain900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.w, 8.w, 12.w, 8.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F8FA),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      spacing: 8.w,
                      children: [
                        Assets.icons.message.svg(
                          colorFilter: ColorFilter.mode(
                            Color(0xFF292D32),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          '123',
                          style: DLSTextStyle.labelXSmall.copyWith(
                            color: DLSColors.textMain900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.w, 8.w, 12.w, 8.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F8FA),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      spacing: 8.w,
                      children: [
                        Assets.icons.repeatCircle.svg(
                          colorFilter: ColorFilter.mode(
                            Color(0xFF292D32),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          '456',
                          style: DLSTextStyle.labelXSmall.copyWith(
                            color: DLSColors.textMain900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(DLSSizing.radiusFull),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6A30C9), Color(0xFFC144C8)],
                      begin: Alignment(-1, 0),
                      end: Alignment(0.75, -1.15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.5),
                        blurRadius: 12,
                        offset: Offset(0, 8),
                        inset: true,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: DLSSizing.xSmall.w,
                    vertical: DLSSizing.s2xSmall.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          spacing: 4.w,
                          children: [
                            Text(
                              'Mint Tweet',
                              style: DLSTextStyle.labelSmall.copyWith(
                                color: DLSColors.textWhite0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Assets.icons.arrowHeadDashed.svg(
                              colorFilter: ColorFilter.mode(
                                DLSColors.iconWhite0,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Coming Soon',
                        style: DLSTextStyle.labelSmall.copyWith(
                          color: DLSColors.textWhite0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
