import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/widgets/custom_progress_bar.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class BadgesList extends StatelessWidget {
  const BadgesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: GridView.custom(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.w,
          crossAxisSpacing: 8.w,
          childAspectRatio: 0.75,
        ),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          bool isMinted = index == 2;
          bool isProgress = index == 3;

          return Container(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                Assets.images.iconExampleBadge.image(width: 0.3.sw),
                Visibility(
                  visible: !isProgress,
                  replacement: Container(
                    padding: EdgeInsets.all(DLSSizing.xSmall),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'The Challenger',
                          style: DLSTextStyle.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '1 of 3 Friends Joined',
                          style: DLSTextStyle.labelSmall.copyWith(
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        CustomProgressBar(currentXp: 1, maxXp: 3),
                        Container(
                          margin: EdgeInsets.only(top: 8.h),
                          child: Row(
                            spacing: 4.w,
                            children: [
                              Expanded(
                                child: Row(
                                  spacing: 8.w,
                                  children: [
                                    Assets.images.coin.image(width: 12.w),
                                    Text(
                                      '+25',
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: Colors.black.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  spacing: 2.w,
                                  children: [
                                    Transform.rotate(
                                      angle: 90,
                                      child: Assets.images.chromeStar.image(
                                        width: 14.w,
                                      ),
                                    ),
                                    Text(
                                      '+5',
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: Colors.black.withValues(
                                          alpha: 0.5,
                                        ),
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
                  ),
                  child: Container(
                    padding: EdgeInsets.all(DLSSizing.xSmall),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Color(0xFFF1F5F8),
                    ),
                    child: Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'The Connector',
                          style: DLSTextStyle.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '3 of Friends Joined',
                          style: DLSTextStyle.labelSmall.copyWith(
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                if (!isProgress)
                  Visibility(
                    visible: !isMinted,
                    replacement: Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text(
                        'Minted',
                        style: DLSTextStyle.labelMedium.copyWith(
                          color: Color(0xFF068AF5).withValues(alpha: 0.65),
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: DLSRadius.radiusFull,
                        gradient: LinearGradient(
                          colors: [Color(0xFF6A30C9), Color(0xFF506DDB)],
                          begin: Alignment(-1, 0),
                          end: Alignment(0.75, -1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withValues(alpha: 0.5),
                            offset: Offset(0, 8),
                            blurRadius: 12,
                            inset: true,
                          ),
                          BoxShadow(
                            color: Color(0xFF375DFB).withValues(alpha: 0.08),
                            offset: Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        spacing: 8.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mint Badge',
                            style: DLSTextStyle.labelMedium.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Assets.icons.arrowHeadDashed.svg(width: 10.w),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        }, childCount: 4),
      ),
    );
  }
}
