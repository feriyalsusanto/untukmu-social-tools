import 'dart:ui' as ui;

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/views/widgets/profile_score_item.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/daily_check_in_component.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/dynamic_progress_bar.dart';
import 'package:untukmu_social_tools/app/styles/custom_painters/checkin_background_painter.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class CheckInWidget extends StatelessWidget {
  const CheckInWidget({super.key});

  Future<ui.Image> _loadImageCheckin() async {
    const keyName = 'assets/images/background_checkin_2.png';
    final data = (await rootBundle.load(keyName));
    final bytes = data.buffer.asUint8List();
    final uiProfileImage = await decodeImageFromList(bytes);
    return uiProfileImage;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: FutureBuilder(
        future: _loadImageCheckin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 72.h),
                  child: CustomPaint(
                    painter: CheckinBackgroundPainter(image: snapshot.data!),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.w,
                        right: 12.w,
                        top: 53.h,
                        bottom: 12.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'The Builder',
                                  style: CustomTextStyles.neueMontrealMedium20
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: DLSRadius.radius12,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF6A30C9),
                                      Color(0xFF506DDB),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                      offset: const Offset(0, 8),
                                      blurRadius: 12,
                                      inset: true,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'Fuse with C-DID',
                                  style: CustomTextStyles.lufgaRegular12
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'You\'re part of a group of on-chain land NFT holders who speak the language of investment.',
                            style: CustomTextStyles.neueMontrealRegular12
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            spacing: 8.w,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ProfileScoreItem(
                                label: 'Top 5%',
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.white.withValues(
                                  alpha: 0.25,
                                ),
                              ),
                              ProfileScoreItem(
                                label: '480 User Matched',
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.white.withValues(
                                  alpha: 0.25,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          DynamicProgressBar(
                            activeIndex: 0,
                            labels: ['Overseer', 'Technician', 'Tinkerer'],
                          ),
                          SizedBox(height: 24.h),
                          DailyCheckInComponent(),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Assets.images.gearHat.image(width: 0.45.sw),
                    Container(
                      margin: EdgeInsets.only(top: 40.h),
                      child: Column(
                        spacing: 4.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Powered By',
                            style: CustomTextStyles.neueMontrealRegular10
                                .copyWith(
                                  color: Colors.white.withValues(alpha: 0.5),
                                ),
                          ),
                          Assets.icons.somniaLogo.svg(width: 0.225.sw),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
