import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

enum ImpactCounterSize { small, normal }

enum ImpactCounterType { positive, negative }

class ImpactCounter extends StatelessWidget {
  const ImpactCounter({
    super.key,
    this.size = ImpactCounterSize.normal,
    this.type = ImpactCounterType.positive,
    required this.value,
  });

  final ImpactCounterSize size;
  final ImpactCounterType type;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(1.5.w, 1.5.w, 6.w, 1.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DLSSizing.radiusFull),
        border: Border.all(
          color:
              type == ImpactCounterType.positive
                  ? Color(0xFFA0CDA0)
                  : Color(0xFFFE3F41),
          width: 0.88,
        ),
      ),
      child: Row(
        spacing: 6.w,
        children: [
          type == ImpactCounterType.positive
              ? Assets.icons.impactUp.svg(
                width: size == ImpactCounterSize.normal ? 20.w : 14.w,
              )
              : Assets.icons.impactDown.svg(
                width: size == ImpactCounterSize.normal ? 20.w : 14.w,
              ),
          Text(
            value,
            style: (size == ImpactCounterSize.small
                    ? CustomTextStyles.neueMontrealMedium10
                    : CustomTextStyles.neueMontrealMedium12)
                .copyWith(
                  color:
                      type == ImpactCounterType.positive
                          ? Color(0xFFA0CDA0)
                          : Color(0xFFFE3F41),
                ),
          ),
        ],
      ),
    );
  }
}
