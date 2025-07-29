import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/social_media_button.dart';
import 'package:untukmu_social_tools/app/styles/custom_clippers/curve_top_clipper.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class XPBadgesTab extends StatelessWidget {
  const XPBadgesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: DLSSizing.xSmall,
              vertical: DLSSizing.s2xSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
              color: Colors.white,
            ),
            child: Row(
              spacing: 12.w,
              children: [
                Expanded(
                  child: SocialMediaButton(
                    label: 'Badges',
                    assetName: Assets.icons.trendUp.path,
                    onPressed: () {},
                    darkMode: true,
                    iconPosition: IconPosition.clip,
                    showIconBackground: false,
                    buttonRadius: ButtonRadius.full,
                  ),
                ),
                Expanded(
                  child: SocialMediaButton(
                    label: 'NFT',
                    assetName: Assets.icons.chartSuccess.path,
                    onPressed: () {},
                    iconPosition: IconPosition.clip,
                    showIconBackground: false,
                    buttonRadius: ButtonRadius.full,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 24.w),
          child: ClipPath(
            clipper: CurveTopClipper(),
            child: Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
