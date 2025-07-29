import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class ProfileScoreItem extends StatelessWidget {
  const ProfileScoreItem({
    super.key,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.w, 2.h, 2.w, 2.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xFF16131F),
        borderRadius: DLSRadius.radiusFull,
      ),
      child: Row(
        spacing: 8.w,
        children: [
          Text(
            label,
            style: CustomTextStyles.neueMontrealRegular10.copyWith(
              color: foregroundColor ?? Colors.white.withValues(alpha: 0.5),
            ),
          ),
          Assets.icons.iconInfoCircle.svg(
            width: 12.w,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.5),
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
