import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/controllers/profile_controller.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/views/painters/profile_image_background_painter.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/views/painters/profile_info_background_painter.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/views/widgets/profile_score_item.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class AuthProfilePage extends StatefulWidget {
  const AuthProfilePage({super.key});

  @override
  State<AuthProfilePage> createState() => _AuthProfilePageState();
}

class _AuthProfilePageState extends State<AuthProfilePage> {
  final ProfileController _profileController = ProfileController.instance;

  @override
  void initState() {
    super.initState();
    _profileController.setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(
          top: kToolbarHeight.h + 16.h,
          left: 12.w,
          right: 12.w,
          bottom: 28.h,
        ),
        child: Column(
          children: [
            Text(
              'You\'re all set!',
              style: DLSTextStyle.titleH4.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'You\'ll see your influence score, interests, badges, and matched campaigns as soon as your data is analyzed.',
              style: DLSTextStyle.paragraphSmall.copyWith(
                color: DLSColors.textSoft400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            // Profile Widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Color(0xFF1F1B2B),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  width: 228.w,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 286.h,
                            child: Stack(
                              children: [
                                Stack(
                                  children: [
                                    GetBuilder<ProfileController>(
                                      builder: (controller) {
                                        if (controller.isLoading) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: DLSColors.primaryBase,
                                            ),
                                          );
                                        }

                                        final image = controller.uiProfileImage;

                                        return CustomPaint(
                                          size: Size(250, 250),
                                          painter: ProfileImageBackground(
                                            image: image!,
                                          ),
                                        );
                                      },
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            right: 8.w,
                                            left: 8.w,
                                            top: 2.h,
                                            bottom: 2.h,
                                          ),
                                          child: Assets.icons.iconMore.svg(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CustomPaint(
                                    size: Size(250.w, 90.h),
                                    painter: ProfileInfoBackground(),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 8.w,
                                        top: 6.h,
                                      ),
                                      width: 250.w,
                                      height: 90.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'AI-DID',
                                            style: CustomTextStyles
                                                .geistMonoMedium10
                                                .copyWith(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.5),
                                                ),
                                          ),
                                          SizedBox(height: 12.h),
                                          Text(
                                            'Ethan Mitchell',
                                            style: CustomTextStyles
                                                .neueMontrealRegular20
                                                .copyWith(color: Colors.white),
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            '@ethanmitchell',
                                            style: CustomTextStyles
                                                .neueMontrealRegular10
                                                .copyWith(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.5),
                                                ),
                                          ),
                                          SizedBox(height: 6.h),
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                SizedBox(width: 56.w),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 4.w,
                                                        ),
                                                    child: CustomButtonWidget(
                                                      size:
                                                          CustomButtonSize
                                                              .xSmall,
                                                      label: 'The Builder',
                                                      onPressed: () {},
                                                      prefixWidget: Assets
                                                          .images
                                                          .iconGear
                                                          .image(width: 14.w),
                                                      suffixWidget: Assets
                                                          .icons
                                                          .iconInfoCircle
                                                          .svg(width: 16.w),
                                                      expanded: true,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          spacing: 10.h,
                          children: [
                            Text(
                              'Shaping Somnia’s world with skill and strategy. you build, test, and lead your crew through every mission.',
                              style: CustomTextStyles.neueMontrealMedium10
                                  .copyWith(color: Colors.white),
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
                            Text(
                              'Your Ranking',
                              style: CustomTextStyles.neueMontrealRegular10
                                  .copyWith(
                                    color: Colors.white.withValues(alpha: 0.5),
                                  ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '#',
                                style: CustomTextStyles.neueMontrealRegular32
                                    .copyWith(
                                      color: Colors.white.withValues(
                                        alpha: 0.25,
                                      ),
                                    ),
                                children: [
                                  TextSpan(
                                    text: '90',
                                    style: CustomTextStyles
                                        .neueMontrealRegular32
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Text(
              'Data analysis in progress. This usually takes less than 30 seconds.',
              style: DLSTextStyle.paragraphSmall.copyWith(
                color: Color(0xFF4B5563),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
