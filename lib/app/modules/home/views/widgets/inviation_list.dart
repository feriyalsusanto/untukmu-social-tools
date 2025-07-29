import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/styles/custom_clippers/curve_top_clipper.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class InviationList extends StatelessWidget {
  InviationList({super.key});

  final List<String> dummyData = List.generate(4, (index) {
    return 'data';
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.h),
      padding: EdgeInsets.all(DLSSizing.s3xSmall),
      decoration: BoxDecoration(
        color: DLSColors.bgSoft200,
        borderRadius: DLSRadius.radius32,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 40.w, 16.h),
                decoration: BoxDecoration(
                  color: DLSColors.bgWhite0,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                child: Text(
                  'Invite Friends',
                  style: CustomTextStyles.neueMontrealRegular20,
                ),
              ),
              ClipPath(
                clipper: CurveTopClipper(),
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              left: DLSSizing.xSmall,
              right: DLSSizing.xSmall,
              bottom: DLSSizing.xSmall,
            ),
            decoration: BoxDecoration(
              color: DLSColors.bgWhite0,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 0.35.sw,
                      child: Divider(height: 1, color: Color(0xFFE2E4E9)),
                    ),
                  ],
                ),
                SizedBox(height: DLSSizing.xSmall),
                Container(
                  padding: EdgeInsets.all(DLSSizing.s2xSmall),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    border: Border.all(color: DLSColors.strokeSub300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'About Invitations',
                        style: CustomTextStyles.neueMontrealMedium16,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'You\'ll earn 1 invite code every 5 levels or from select badge rewards. Invites are limited. If your invitee reaches Level 5, you get bonus XP. If your invitee violates the rules, your integrity score may drop.',
                        style: CustomTextStyles.neueMontrealMedium12,
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        spacing: 12.w,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: DLSColors.primaryBase,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: DLSRadius.radiusFull,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 12.h,
                              ),
                            ),
                            child: Row(
                              spacing: 8.w,
                              children: [
                                Assets.icons.iconProfileAdd.svg(width: 16.w),
                                Text(
                                  'Invite',
                                  style: DLSTextStyle.labelSmall.copyWith(
                                    color: DLSColors.textWhite0,
                                  ),
                                ),
                                Container(
                                  width: 16.w,
                                  height: 16.w,
                                  decoration: BoxDecoration(
                                    borderRadius: DLSRadius.radiusFull,
                                    color: DLSColors.bgWhite0,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '5',
                                      style: DLSTextStyle.labelXSmall.copyWith(
                                        color: DLSColors.primaryBase,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 10.h,
                              ),
                              foregroundColor: DLSColors.bgSoft200,
                              backgroundColor: DLSColors.bgWhite0,
                            ),
                            child: Text(
                              'Learn more',
                              style: DLSTextStyle.labelSmall.copyWith(
                                color: DLSColors.textSoft400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        spacing: 8.w,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(DLSSizing.s2xSmall),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F5F8),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 20.h,
                              children: [
                                Row(
                                  spacing: 12.w,
                                  children: [
                                    ClipRRect(
                                      borderRadius: DLSRadius.radiusFull,
                                      child: Assets.images.defaultProfilePicture
                                          .image(width: 40.w, height: 40.w),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'If invitee',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                color: DLSColors.textSub500,
                                              ),
                                        ),
                                        Text(
                                          '+24 Xp',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                color: Color(0xFF21A077),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 12.w,
                                  children: [
                                    ClipRRect(
                                      borderRadius: DLSRadius.radiusFull,
                                      child: Assets.images.defaultProfilePicture
                                          .image(width: 40.w, height: 40.w),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Or if invitee',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                color: DLSColors.textSub500,
                                              ),
                                        ),
                                        Text(
                                          '-42 Xp',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                color: Color(0xFFFE3F41),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Assets.icons.iconArrowRightFilled.svg(
                            colorFilter: ColorFilter.mode(
                              Color(0xFF292D32),
                              BlendMode.srcIn,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(DLSSizing.s2xSmall),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F5F8),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 20.h,
                              children: [
                                Row(
                                  spacing: 12.w,
                                  children: [
                                    ClipRRect(
                                      borderRadius: DLSRadius.radiusFull,
                                      child: Assets.images.defaultProfilePicture
                                          .image(width: 40.w, height: 40.w),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your karma',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                color: DLSColors.textSub500,
                                              ),
                                        ),
                                        Text(
                                          '+24 Xp',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                color: Color(0xFF21A077),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 12.w,
                                  children: [
                                    ClipRRect(
                                      borderRadius: DLSRadius.radiusFull,
                                      child: Assets.images.defaultProfilePicture
                                          .image(width: 40.w, height: 40.w),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your karma',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                color: DLSColors.textSub500,
                                              ),
                                        ),
                                        Text(
                                          '-42 Xp',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                color: Color(0xFFFE3F41),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  height: 206.h,
                  width: MediaQuery.of(context).size.width + 135.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F5F8),
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width + 135.w,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final boxDecorationNormal = BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                            );

                            // header
                            if (index == 0) {
                              return Container(
                                margin: EdgeInsets.fromLTRB(
                                  12.w,
                                  12.h,
                                  12.w,
                                  4.h,
                                ),
                                child: Row(
                                  spacing: 4.w,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: tableHeader(label: 'User'),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: tableHeader(
                                        label: 'Invited',
                                        center: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: tableHeader(
                                        label: 'Status',
                                        center: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: tableHeader(
                                        label: 'Lv. 5 Progress',
                                        center: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: tableHeader(
                                        label: 'Level',
                                        center: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: tableHeader(
                                        label: 'Karma Impact',
                                        center: true,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return Container(
                              margin: EdgeInsets.only(
                                left: 4.w,
                                right: 4.w,
                                top: 4.w,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 8.w,
                              ),
                              decoration: boxDecorationNormal,
                              child: Row(
                                spacing: 4.w,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      spacing: 12.w,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            100.r,
                                          ),
                                          child: Assets
                                              .images
                                              .defaultProfilePicture
                                              .image(width: 24.w),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Name',
                                              style: DLSTextStyle.labelMedium
                                                  .copyWith(
                                                    color:
                                                        DLSColors.textMain900,
                                                  ),
                                            ),
                                            Text(
                                              '@username',
                                              style: DLSTextStyle.labelXSmall
                                                  .copyWith(
                                                    color:
                                                        DLSColors.textSoft400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${Random().nextInt(365)}d ago',
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: DLSColors.textMain900,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      spacing: 4.w,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.brightness_1,
                                          size: 8.w,
                                          color: DLSColors.basilGreenBase,
                                        ),
                                        Text(
                                          'Joined',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                color: DLSColors.textMain900,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: RichText(
                                      text: TextSpan(
                                        text: '3',
                                        children: [
                                          TextSpan(
                                            text: '/5',
                                            style: DLSTextStyle.labelSmall
                                                .copyWith(
                                                  color: DLSColors.textSoft400,
                                                ),
                                          ),
                                        ],
                                        style: DLSTextStyle.labelSmall.copyWith(
                                          color: DLSColors.textMain900,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      (index).toString(),
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: DLSColors.textMain900,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '+24 Xp',
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: DLSColors.textMain900,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 8.h);
                          },
                          itemCount: dummyData.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tableHeader({required String label, bool center = false}) {
    return Text(
      label,
      style: DLSTextStyle.labelSmall.copyWith(color: DLSColors.textSub500),
      textAlign: center ? TextAlign.center : TextAlign.left,
    );
  }
}
