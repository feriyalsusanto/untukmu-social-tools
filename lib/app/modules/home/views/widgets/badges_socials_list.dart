import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class BadgesSocialsList extends StatelessWidget {
  const BadgesSocialsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 145.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            spacing: 10.w,
            children: [
              Container(
                width: 0.6.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Color(0xFFF1F5F8),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.w,
                        horizontal: 12.w,
                      ),
                      child: Row(
                        spacing: 8.w,
                        children: [
                          Assets.images.coin.image(width: 24.w),
                          Text('XP & Badges', style: DLSTextStyle.labelMedium),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          gradient: LinearGradient(
                            colors: [Color(0xFF6A30C9), Color(0xFF506DDB)],
                            begin: Alignment(-1, 0),
                            end: Alignment(0.75, -1),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: DLSSizing.xSmall,
                                vertical: 18.w,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF1A1A1A),
                                borderRadius: BorderRadius.circular(
                                  DLSSizing.s2xSmall,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    blurRadius: 12,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                spacing: 4.h,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Current Level',
                                          style: DLSTextStyle.labelXSmall
                                              .copyWith(
                                                color: Colors.white.withValues(
                                                  alpha: 0.5,
                                                ),
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '6',
                                        style: DLSTextStyle.labelXSmall
                                            .copyWith(
                                              color: Color(0xFFA0CDA0),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Text(
                                              '435',
                                              style: DLSTextStyle.labelLarge
                                                  .copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                            Text(
                                              'Xp',
                                              style: DLSTextStyle.labelLarge
                                                  .copyWith(
                                                    color: Colors.white
                                                        .withValues(
                                                          alpha: 0.25,
                                                        ),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              '3',
                                              style: DLSTextStyle.labelLarge
                                                  .copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                            Text(
                                              'Badges',
                                              style: DLSTextStyle.labelLarge
                                                  .copyWith(
                                                    color: Colors.white
                                                        .withValues(
                                                          alpha: 0.25,
                                                        ),
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
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: DLSRadius.radiusFull,
                                ),
                                child: Row(
                                  spacing: 8.w,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Assets.icons.arrowHeadDashed.svg(
                                      width: 12.w,
                                    ),
                                    Text(
                                      '1 Badge Minted',
                                      style: DLSTextStyle.labelMedium.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4.h, bottom: 4.h),
                width: 0.6.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Color(0xFFF1F5F8), width: 2.w),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        spacing: 8.w,
                        children: [
                          Assets.images.iconGlobe.image(width: 24.w),
                          Text(
                            'Connected Socials',
                            style: DLSTextStyle.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: DLSSizing.xSmall,
                          vertical: DLSSizing.s2xSmall,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F5F8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                        ),
                        child: Column(
                          spacing: 4.h,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              spacing: 2.w,
                              children: [
                                Text('X', style: DLSTextStyle.labelMedium),
                                Text(
                                  '(Twitter)',
                                  style: DLSTextStyle.labelMedium.copyWith(
                                    color: Colors.black.withValues(alpha: 0.25),
                                  ),
                                ),
                                Assets.images.iconVerified.image(width: 16.w),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '@ethanmitchell',
                                    style: DLSTextStyle.labelSmall.copyWith(
                                      color: Colors.black.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  spacing: 5.w,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.circleArrowUp,
                                      size: 10.w,
                                      color: Color(0xFFA0CDA0),
                                    ),
                                    Text(
                                      'Connected',
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: Color(0xFFA0CDA0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
      ),
    );
  }
}
