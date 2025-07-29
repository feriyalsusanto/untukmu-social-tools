import 'dart:ui' as ui;

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/views/widgets/profile_score_item.dart';
import 'package:untukmu_social_tools/app/styles/custom_painters/full_profile_background_painter.dart';
import 'package:untukmu_social_tools/app/styles/custom_painters/full_profile_info_background_painter.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  Future<ui.Image> _loadImage() async {
    const keyName = 'assets/images/default_profile_picture.png';
    final data = (await rootBundle.load(keyName));
    final bytes = data.buffer.asUint8List();
    final uiProfileImage = await decodeImageFromList(bytes);
    return uiProfileImage;
  }

  @override
  Widget build(BuildContext context) {
    var profileSize = 1.sw;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1B2B),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: kToolbarHeight),
          SizedBox(
            height: (profileSize + 104.h - 18.h),
            // height: profileSize * 2,
            child: Stack(
              children: [
                FutureBuilder(
                  future: _loadImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                        width: profileSize,
                        height: profileSize,
                        child: Stack(
                          children: [
                            CustomPaint(
                              size: Size(profileSize, profileSize),
                              painter: FullProfileBackgroundPainter(
                                image: snapshot.data!,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(
                                    right: 8.w,
                                    left: 8.w,
                                    bottom: 2.h,
                                  ),
                                  child: Assets.icons.iconMore.svg(width: 24.w),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomPaint(
                    size: Size(profileSize, 104.h),
                    painter: FullProfileInfoBackgroundPainter(
                      color: Color(0xFF201633),
                    ),
                    child: SizedBox(
                      width: profileSize,
                      height: 104.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, top: 6.h),
                            child: Text(
                              'AI-DID',
                              style: CustomTextStyles.geistMonoMedium10
                                  .copyWith(
                                    color: Colors.white.withValues(alpha: 0.5),
                                  ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, top: 4.h),
                            child: Text(
                              'Ethan Mitchell',
                              style: CustomTextStyles.neueMontrealRegular20
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.w,
                              top: 4.h,
                              bottom: 4.h,
                            ),
                            child: Text(
                              '@ethanmitchell',
                              style: CustomTextStyles.neueMontrealRegular10
                                  .copyWith(
                                    color: Colors.white.withValues(alpha: 0.5),
                                  ),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              SizedBox(width: profileSize / 1.95),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  ),
                                  child: CustomButtonWidget(
                                    size: CustomButtonSize.xSmall,
                                    label: 'The Builder',
                                    onPressed: () {},
                                    prefixWidget: Assets.images.iconGear.image(
                                      width: 14.w,
                                    ),
                                    suffixWidget: Assets.icons.iconInfoCircle
                                        .svg(width: 16.w),
                                    expanded: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              spacing: 12.h,
              children: [
                Text(
                  'Shaping Somnia\'s world with skill and strategy. you build, test, and lead your crew through every mission.',
                  style: CustomTextStyles.neueMontrealMedium14.copyWith(
                    color: Colors.white,
                  ),
                ),
                Row(
                  spacing: 8.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileScoreItem(label: 'Top 5%'),
                    ProfileScoreItem(label: '480 User Matched'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(DLSSizing.xSmall.w),
            decoration: BoxDecoration(
              color: Color(0xFF16131F),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 4.h,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Your Ranking',
                        style: CustomTextStyles.neueMontrealRegular10.copyWith(
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                    Row(
                      spacing: 4.w,
                      children: [
                        Assets.icons.iconArrowDown.svg(width: 10.w),
                        Text(
                          '-4',
                          style: CustomTextStyles.neueMontrealRegular10
                              .copyWith(color: Color(0xFFFE3F41)),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: '#',
                          style: CustomTextStyles.neueMontrealRegular32
                              .copyWith(
                                color: Colors.white.withValues(alpha: 0.25),
                              ),
                          children: [
                            TextSpan(
                              text: '90',
                              style: CustomTextStyles.neueMontrealRegular32
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: DLSSizing.s2xSmall.w,
                        vertical: DLSSizing.s3xSmall.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: DLSRadius.radiusFull,
                      ),
                      child: Row(
                        spacing: 12.w,
                        children: [
                          Text(
                            'Leaderboard',
                            style: CustomTextStyles.neueMontrealRegular12
                                .copyWith(color: Colors.white),
                          ),
                          Icon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.white,
                            size: 8.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(DLSSizing.radiusFull),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6A30C9), Color(0xFF506DDB)],
                  begin: Alignment(-1, 0),
                  end: Alignment(0.75, -1.15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.5),
                    blurRadius: 12,
                    offset: Offset(0, 8),
                    inset: true,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: DLSSizing.xSmall.w,
                vertical: DLSSizing.s2xSmall.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      spacing: 4.w,
                      children: [
                        Text(
                          'Mint Profile',
                          style: DLSTextStyle.labelSmall.copyWith(
                            color: DLSColors.textWhite0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Assets.icons.arrowHeadDashed.svg(
                          colorFilter: ColorFilter.mode(
                            DLSColors.iconWhite0,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Coming Soon',
                    style: DLSTextStyle.labelSmall.copyWith(
                      color: DLSColors.textWhite0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
