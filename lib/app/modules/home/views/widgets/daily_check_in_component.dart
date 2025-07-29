import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class DailyCheckInComponent extends StatelessWidget {
  const DailyCheckInComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DLSSizing.xSmall),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: DLSRadius.radius24,
        border: GradientBoxBorder(
          width: 2,
          gradient: LinearGradient(
            colors: [Color(0xFF6A30C9), Color(0xFF506DDB)],
          ),
        ),
      ),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            spacing: 12.w,
            children: [
              Assets.icons.iconCalendar.svg(width: 32.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [Color(0xFF6A30C9), Color(0xFF506DDB)],
                        begin: Alignment(-1, 0),
                        end: Alignment(0.75, -1),
                      ).createShader(bounds);
                    },
                    child: Text(
                      'Daily Check-In',
                      style: DLSTextStyle.labelLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    spacing: 8.w,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: DLSRadius.radiusFull,
                          color: Colors.black,
                        ),
                        child: Text(
                          'XP Booster: 1.2x',
                          style: DLSTextStyle.labelMedium.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: DLSRadius.radiusFull,
                          border: Border.all(color: Color(0xFF6A30C9)),
                          color: Colors.white,
                        ),
                        child: Text(
                          '12-Days Streak',
                          style: DLSTextStyle.labelMedium.copyWith(
                            color: Color(0xFF6A30C9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
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
            child: Center(
              child: Text(
                'Check-In Now',
                style: DLSTextStyle.labelMedium.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
