import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';

class DynamicProgressBar extends StatelessWidget {
  final int activeIndex; // 0, 1, or 2 for the three steps
  final List<String> labels; // Labels for each step

  const DynamicProgressBar({
    super.key,
    required this.activeIndex,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 16.h),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate progress width based on active index
                double progressWidth = _calculateProgressWidth(
                  constraints.maxWidth - 32.w,
                ); // Subtract padding

                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Background border
                    Container(
                      margin: EdgeInsets.only(top: 5.h),
                      height: 8.h,
                      decoration: BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0.25),
                              Colors.white.withValues(alpha: 0),
                            ],
                            stops: [0.75, 1],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          width: 1,
                        ),
                        borderRadius: DLSRadius.radiusFull,
                      ),
                    ),
                    // Progress bar
                    Container(
                      margin: EdgeInsets.only(top: 5.h),
                      height: 8.h,
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            height: 8.h,
                            width: progressWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(
                                  activeIndex == 2 ? 12 : 0,
                                ),
                                bottomRight: Radius.circular(
                                  activeIndex == 2 ? 12 : 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Step indicators
                    Padding(
                      padding: EdgeInsets.only(right: 16.w, left: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (index) {
                          bool isActive = index <= activeIndex;
                          return Column(
                            spacing: 8.h,
                            children: [
                              SizedBox(
                                height: 18.h,
                                width: 18.h,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: Colors.white,
                                      size: 18.h,
                                    ),
                                    Icon(
                                      Icons.brightness_1,
                                      color:
                                          isActive
                                              ? DLSColors.primaryBase
                                              : Color(0xFF380063),
                                      size: isActive ? 10.h : 16.h,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                labels[index],
                                style: CustomTextStyles.neueMontrealMedium10
                                    .copyWith(
                                      color:
                                          isActive
                                              ? Colors.white
                                              : Colors.white.withValues(
                                                alpha: 0.5,
                                              ),
                                    ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: DLSRadius.radiusFull,
          ),
          child: Row(
            spacing: 4.w,
            children: [
              Text('Level Up', style: DLSTextStyle.labelXSmall),
              Icon(
                FontAwesomeIcons.chevronRight,
                color: DLSColors.textMain900,
                size: 8.w,
              ),
            ],
          ),
        ),
      ],
    );
  }

  double _calculateProgressWidth(double totalWidth) {
    switch (activeIndex) {
      case 0:
        return totalWidth * 0.19; // 33% for first step
      case 1:
        return totalWidth * 0.55; // 66% for second step
      case 2:
        return totalWidth; // 100% for final step
      default:
        return 0;
    }
  }
}
