import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/styles/custom_clippers/curve_top_clipper.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class DigitalIdentity extends StatelessWidget {
  const DigitalIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Container(
            height: (1.sw - 32.w) + 0.175.sh,
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: Color(0xFFF1F5F8),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Text(
                          'Digital Identity',
                          style: DLSTextStyle.labelMedium.copyWith(
                            color: DLSColors.textMain900.withValues(alpha: 0.5),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Assets.images.defaultProfilePicture.image(
                          width: 1.sw - 32.w,
                          height: 1.sw - 32.w,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 0.5.sw,
                                minWidth: 0.25.sw,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              child: Text(
                                'Ethan\nMitchell',
                                style: DLSTextStyle.labelLarge,
                              ),
                            ),
                            ClipPath(
                              clipper: CurveTopClipper(),
                              child: Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          child: Row(
                            spacing: 8.w,
                            children: [
                              CircleAvatar(
                                maxRadius: 14.r,
                                backgroundColor: DLSColors.pacificBlueDark,
                                foregroundColor: DLSColors.iconWhite0,
                                child: Icon(
                                  FontAwesomeIcons.wallet,
                                  size: 12.w,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  spacing: 4.h,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Your Persona',
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: DLSColors.textMain900.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'DRX Yield Farmer & Urban Explorer',
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: DLSColors.textMain900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(DLSSizing.xSmall.w),
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F5F8),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Your Ranking',
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: DLSColors.textMain900.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    spacing: 4.w,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidCircleDown,
                                        size: 10.w,
                                        color: Color(0xFFFE3F41),
                                      ),
                                      Text(
                                        '-4',
                                        style: DLSTextStyle.labelSmall.copyWith(
                                          color: Color(0xFFFE3F41),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: '# ',
                                        style: DLSTextStyle.titleH2.copyWith(
                                          color: DLSColors.textMain900
                                              .withValues(alpha: 0.25),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '90',
                                            style: DLSTextStyle.titleH2
                                                .copyWith(
                                                  color: DLSColors.textMain900,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFF6F8FA),
                                      foregroundColor: DLSColors.textMain900,
                                      elevation: 0,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: DLSSizing.xSmall,
                                        vertical: DLSSizing.s3xSmall,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          DLSSizing.radiusFull,
                                        ),
                                      ),
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Row(
                                      spacing: 4.w,
                                      children: [
                                        Text(
                                          'Leaderboard',
                                          style: DLSTextStyle.labelMedium
                                              .copyWith(
                                                color: DLSColors.textSoft400,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.chevronRight,
                                          size: 10.w,
                                          color: DLSColors.iconSoft400,
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
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(DLSSizing.radiusFull),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6A30C9), Color(0xFF506DDB)],
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
                          'Mint Profile',
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
    );
  }
}
