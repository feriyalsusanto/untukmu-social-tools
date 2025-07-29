import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/widgets/custom_progress_bar.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class ChallengeQuestList extends StatelessWidget {
  const ChallengeQuestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Row(
            spacing: 8.w,
            children: [
              Assets.icons.sparkleBlue.svg(width: 24.w),
              Text('Challenges and Quest', style: DLSTextStyle.labelLarge),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.w,
              crossAxisSpacing: 8.w,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                child: Column(
                  spacing: 4.h,
                  children: [
                    Assets.images.badgesDefault.image(
                      width: 0.25.sw,
                      color: DLSColors.textMain900.withValues(alpha: 0.25),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: DLSColors.textMain900.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Column(
                          spacing: 4.h,
                          children: [
                            Text('Badge Name', style: DLSTextStyle.labelMedium),
                            Text(
                              'Reach 0/1,000 score',
                              style: DLSTextStyle.labelSmall.copyWith(
                                color: DLSColors.textMain900.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                            ),
                            CustomProgressBar(currentXp: 0, maxXp: 1000),
                            Container(
                              margin: EdgeInsets.only(top: 4.h),
                              child: Row(
                                spacing: 4.w,
                                children: [
                                  Expanded(
                                    child: Row(
                                      spacing: 4.w,
                                      children: [
                                        Assets.images.coin.image(width: 14.w),
                                        Text(
                                          '+25',
                                          style: DLSTextStyle.labelMedium
                                              .copyWith(
                                                color: DLSColors.textMain900
                                                    .withValues(alpha: 0.5),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      spacing: 4.w,
                                      children: [
                                        Transform.rotate(
                                          angle: 90,
                                          child: Assets.images.chromeStar.image(
                                            width: 14.w,
                                          ),
                                        ),
                                        Text(
                                          '+5',
                                          style: DLSTextStyle.labelMedium
                                              .copyWith(
                                                color: DLSColors.textMain900
                                                    .withValues(alpha: 0.5),
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
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12.h, bottom: 16.h),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: DLSRadius.radiusFull,
            border: Border.all(color: DLSColors.strokeDisabled100),
          ),
          child: Text(
            'See More',
            style: DLSTextStyle.labelMedium.copyWith(
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ),
        ),
      ],
    );
  }
}
