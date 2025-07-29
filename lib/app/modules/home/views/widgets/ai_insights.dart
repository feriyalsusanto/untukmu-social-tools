import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class AIInsights extends StatelessWidget {
  const AIInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Color(0xFFE896FE).withValues(alpha: 0.5),
        borderRadius: DLSRadius.radius24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 5.h,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8.w,
                  children: [
                    Assets.icons.sparkleBlue.svg(
                      colorFilter: ColorFilter.mode(
                        Color(0xFF6A30C9),
                        BlendMode.srcIn,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'AI Insights',
                        style: DLSTextStyle.labelLarge.copyWith(
                          color: DLSColors.textMain900,
                        ),
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.chevronUp,
                      color: Color(0xFF450B80),
                      size: 18.w,
                    ),
                  ],
                ),
                Row(
                  spacing: 4.w,
                  children: [
                    Text(
                      'Powered By',
                      style: DLSTextStyle.labelXSmall.copyWith(
                        color: DLSColors.textMain900.withValues(alpha: 0.5),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: DLSRadius.radius4,
                        gradient: LinearGradient(
                          colors: [Color(0xFF6A30C9), Color(0xFFC144C8)],
                          begin: Alignment(-1, 0),
                          end: Alignment(0.75, -1),
                        ),
                      ),
                      child: Text(
                        'foruai',
                        style: DLSTextStyle.labelXSmall.copyWith(
                          color: DLSColors.textWhite0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12.h),
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF6A30C9).withValues(alpha: 0.5),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    spacing: 8.w,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.w),
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF6A30C9), Color(0xFFC144C8)],
                            begin: Alignment(-1, 0),
                            end: Alignment(0.75, -1),
                          ),
                          borderRadius: DLSRadius.radiusFull,
                        ),
                        child: Assets.icons.lampCharge.svg(),
                      ),
                      Text(
                        'The LRT Conversation',
                        style: DLSTextStyle.labelMedium.copyWith(
                          color: DLSColors.textMain900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F5F8),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Sentiment is cautiously optimistic (75% Positive). The conversation focuses less on hype and '
                    'more on security audits, risk analysis between top protocols, and long-term sustainability.',
                    style: DLSTextStyle.labelSmall.copyWith(
                      color: DLSColors.textMain900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
