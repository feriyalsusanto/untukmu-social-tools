import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class DigitalDNAItem extends StatelessWidget {
  const DigitalDNAItem({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5.sw,
      height: 0.25.sw,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border:
            isSelected
                ? null
                : Border.all(color: Colors.black.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'DeFi',
                    style: DLSTextStyle.labelLarge.copyWith(
                      color: isSelected ? Colors.white : DLSColors.textMain900,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '40',
                      style: DLSTextStyle.labelLarge.copyWith(
                        color:
                            isSelected ? Colors.white : DLSColors.textMain900,
                      ),
                    ),
                    Text(
                      '%',
                      style: DLSTextStyle.labelLarge.copyWith(
                        color: (isSelected
                                ? Colors.white
                                : DLSColors.textMain900)
                            .withValues(alpha: 0.25),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'Top 5% DeFi Analyst',
            style: DLSTextStyle.labelLarge.copyWith(
              color: (isSelected ? Colors.white : DLSColors.textMain900)
                  .withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
