import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/badges_list.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/challenge_quest_list.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/daily_check_in_component.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/digital_dna/digital_dna.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/wallet_list_widget.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/xp_badges_tab.dart';
import 'package:untukmu_social_tools/app/modules/widgets/custom_switch.dart';

class XPBadgesComponent extends StatelessWidget {
  const XPBadgesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Color(0xFFE2E4E9),
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Column(
        children: [
          XPBadgesTab(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32.r),
                bottomLeft: Radius.circular(32.r),
                bottomRight: Radius.circular(32.r),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 64.w),
                  child: Divider(color: Colors.black.withValues(alpha: 0.1)),
                ),
                DailyCheckInComponent(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Divider(color: Colors.black.withValues(alpha: 0.1)),
                ),
                CustomSwitch(),
                BadgesList(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Divider(color: Colors.black.withValues(alpha: 0.1)),
                ),
                SizedBox(height: 32.h),
                ChallengeQuestList(),
              ],
            ),
          ),
          DigitalDNA(),
          SizedBox(height: 4.h),
          WalletListWidget(),
        ],
      ),
    );
  }
}
