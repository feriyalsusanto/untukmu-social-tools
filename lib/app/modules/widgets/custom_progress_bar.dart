import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    required this.currentXp,
    required this.maxXp,
  });

  final int currentXp;
  final int maxXp;

  @override
  Widget build(BuildContext context) {
    final progress = currentXp / maxXp;

    return ClipRRect(
      borderRadius: BorderRadius.circular(5.h / 2.r),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: Color(0xFFEEEEEE),
        valueColor: AlwaysStoppedAnimation<Color>(DLSColors.primaryBase),
        minHeight: 5.h,
      ),
    );
  }
}
