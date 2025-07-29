import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/ai_insights.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/digital_dna/item.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/digital_dna/tweet_component.dart';

class DigitalDNA extends StatelessWidget {
  const DigitalDNA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: DLSRadius.radius32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Text(
              'Your Digital DNA',
              style: DLSTextStyle.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D2729).withValues(alpha: 0.5),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
            margin: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 2.w),
            decoration: BoxDecoration(
              color: Color(0xFFF1F5F8),
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8.w,
                    children: List.generate(2, (index) {
                      bool isSelected = index == 0;

                      return DigitalDNAItem(isSelected: isSelected);
                    }),
                  ),
                ),
                DigitalDNATweetComponent(),
                AIInsights(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
