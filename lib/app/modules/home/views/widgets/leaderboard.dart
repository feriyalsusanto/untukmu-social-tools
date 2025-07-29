import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/styles/custom_clippers/curve_top_clipper.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class Leaderboard extends StatelessWidget {
  Leaderboard({super.key});

  final List<String> dummyData = List.generate(12, (index) {
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
                  'Leaderboard',
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
                  // padding: EdgeInsets.all(4.w),
                  height: 656.h,
                  width: MediaQuery.of(context).size.width + 32.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F5F8),
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width + 32.w,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            bool isTop = index == 1 || index == 2 || index == 3;

                            var color = Colors.white;
                            if (isTop) {
                              if (index == 1) {
                                color = Color(0xFFE6AE2C);
                              } else if (index == 2) {
                                color = Color(0xFF848EA4);
                              } else if (index == 3) {
                                color = Color(0xFFB65D37);
                              }
                            }

                            final boxDecorationTop = BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                              border: Border(
                                left: BorderSide(color: color, width: 3.w),
                                top: BorderSide(color: color),
                                right: BorderSide(color: color),
                                bottom: BorderSide(color: color),
                              ),
                            );

                            final boxDecorationNormal = BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                              border: Border(
                                left: BorderSide(color: color, width: 3.w),
                              ),
                            );

                            final boxDecorationUser = BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                              border: Border(
                                left: BorderSide(color: color, width: 2.w),
                              ),
                              gradient: LinearGradient(
                                colors: [Color(0xFF6A30C9), Color(0xFF506DDB)],
                                begin: Alignment(-1, 0),
                                end: Alignment(0.75, -1),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withValues(alpha: 0.25),
                                  offset: Offset(0, -8),
                                  blurRadius: 12,
                                  inset: true,
                                ),
                                BoxShadow(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  offset: Offset(0, 8),
                                  blurRadius: 12,
                                  inset: true,
                                ),
                              ],
                            );
                            bool isMe = index == dummyData.length - 1;

                            var boxDecoration = boxDecorationNormal;
                            if (isTop) {
                              boxDecoration = boxDecorationTop;
                            } else if (index == dummyData.length - 1) {
                              boxDecoration = boxDecorationUser;
                            }

                            // header
                            if (index == 0) {
                              return Container(
                                margin: EdgeInsets.fromLTRB(
                                  8.w,
                                  12.h,
                                  8.w,
                                  4.h,
                                ),
                                child: Row(
                                  spacing: 8.w,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: tableHeader(
                                        label: 'Rank',
                                        center: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: tableHeader(label: 'User'),
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
                                        label: 'Current XP',
                                        center: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: tableHeader(
                                        label: 'Badges',
                                        center: true,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return Container(
                              margin: EdgeInsets.only(
                                top: isMe ? 24.h : 0,
                                left: isMe ? 0 : 4.w,
                                right: isMe ? 0 : 4.w,
                              ),
                              // padding: EdgeInsets.all(8.w),
                              decoration: boxDecoration,
                              child: Row(
                                spacing: 4.w,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.all(8.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(9.r),
                                          bottomLeft: Radius.circular(9.r),
                                        ),
                                        gradient:
                                            isTop
                                                ? LinearGradient(
                                                  colors: [
                                                    color.withValues(
                                                      alpha: 0.5,
                                                    ),
                                                    color.withValues(alpha: 0),
                                                  ],
                                                )
                                                : null,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            (index).toString(),
                                            style: DLSTextStyle.labelMedium
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      isMe
                                                          ? DLSColors.textWhite0
                                                          : DLSColors
                                                              .textMain900,
                                                ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Row(
                                            spacing: 4.w,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Assets.icons.impactUp.svg(
                                                width: 10.w,
                                              ),
                                              Text(
                                                '+4',
                                                style: CustomTextStyles
                                                    .neueMontrealMedium12
                                                    .copyWith(
                                                      color:
                                                          DLSColors
                                                              .basilGreenBase,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                                        isMe
                                                            ? DLSColors
                                                                .textWhite0
                                                            : DLSColors
                                                                .textMain900,
                                                  ),
                                            ),
                                            Text(
                                              '@username',
                                              style: DLSTextStyle.labelXSmall
                                                  .copyWith(
                                                    color:
                                                        isMe
                                                            ? DLSColors
                                                                .textWhite0
                                                            : DLSColors
                                                                .textSoft400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      (index).toString(),
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color:
                                            isMe
                                                ? DLSColors.textWhite0
                                                : DLSColors.textMain900,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: Random().nextInt(500).toString(),
                                        children: [
                                          TextSpan(
                                            text: ' /500',
                                            style: DLSTextStyle.labelSmall
                                                .copyWith(
                                                  color:
                                                      isMe
                                                          ? DLSColors.textWhite0
                                                          : DLSColors
                                                              .textSub500,
                                                ),
                                          ),
                                        ],
                                        style: DLSTextStyle.labelSmall.copyWith(
                                          color:
                                              isMe
                                                  ? DLSColors.textWhite0
                                                  : DLSColors.textMain900,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      (index).toString(),
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color:
                                            isMe
                                                ? DLSColors.textWhite0
                                                : DLSColors.textMain900,
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
                SizedBox(height: 24.h),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.anglesLeft,
                        size: 12.w,
                        color: DLSColors.iconDisabled300,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: DLSColors.bgWeak100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        fixedSize: Size(40.w, 40.w),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.angleLeft,
                        size: 18.w,
                        color: DLSColors.iconDisabled300,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: DLSColors.bgWeak100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        fixedSize: Size(40.w, 40.w),
                      ),
                    ),
                    Expanded(
                      child: Text('Page 1/9999', textAlign: TextAlign.center),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.angleRight,
                        size: 12.w,
                        color: DLSColors.iconDisabled300,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: DLSColors.bgWeak100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        fixedSize: Size(40.w, 40.w),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.anglesRight,
                        size: 18.w,
                        color: DLSColors.iconDisabled300,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: DLSColors.bgWeak100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        fixedSize: Size(40.w, 40.w),
                      ),
                    ),
                  ],
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
