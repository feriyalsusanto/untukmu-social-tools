import 'dart:ui' as ui;

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/controllers/user/user_controller.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/views/widgets/profile_score_item.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/identifi_score_controller.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/impact_score_controller.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/navigation_controller.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/check_in_widget.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/daily_check_in_component.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/dynamic_progress_bar.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/identifi_score_widget.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/profile_widget.dart';
import 'package:untukmu_social_tools/app/styles/custom_painters/checkin_background_painter.dart';
import 'package:untukmu_social_tools/app/styles/custom_painters/full_profile_info_background_painter.dart';
import 'package:untukmu_social_tools/app/modules/home_opportunity/views/home_opportunity_page.dart';
import 'package:untukmu_social_tools/app/modules/home_passport/views/home_passport_page.dart';
import 'package:untukmu_social_tools/app/styles/custom_clippers/curve_top_clipper.dart';
import 'package:untukmu_social_tools/app/styles/custom_painters/full_profile_background_painter.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

part 'widgets/profile_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final navigationController = Get.find<NavigationController>();
  final identifiScoreController = IdentifiScoreController.instance;

  UserController userController = UserController.instance;
  ImpactScoreController scoreController = ImpactScoreController.instance;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    userController.checkUserLoggedIn(
      onUserLoggedIn: () {
        scoreController.getImpactScore();
      },
    );
  }

  Widget getCurrentPage(int index) {
    switch (index) {
      case 0:
        return HomePassportPage();
      case 1:
        return HomeOpportunityPage();
      default:
        return HomePassportPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      // endDrawer: CustomEndDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileWidget(),
            IdentifiScoreWidget(),
            SizedBox(height: 16.h),
            CheckInWidget(),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                color: Color(0xFF1F1B2B),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 8.w,
                    ),
                    child: Column(
                      children: [
                        Row(
                          spacing: 8.w,
                          children: [
                            Assets.images.coin.image(width: 24.w),
                            Text(
                              'XP & Badges',
                              style: CustomTextStyles.neueMontrealRegular16
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.h),
                          padding: EdgeInsets.all(DLSSizing.small),
                          decoration: BoxDecoration(
                            color: Color(0xFF2C263B),
                            borderRadius: BorderRadius.circular(
                              DLSSizing.s2xSmall,
                            ),
                          ),
                          child: Column(
                            spacing: 8.h,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Current Level',
                                      style: CustomTextStyles
                                          .neueMontrealRegular12
                                          .copyWith(
                                            color: Colors.white.withValues(
                                              alpha: 0.5,
                                            ),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    '6',
                                    style: CustomTextStyles.neueMontrealMedium12
                                        .copyWith(color: Color(0xFFA0CDA0)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          '435',
                                          style: CustomTextStyles
                                              .neueMontrealRegular24
                                              .copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          'Xp',
                                          style: CustomTextStyles
                                              .neueMontrealRegular20
                                              .copyWith(
                                                color: Colors.white.withValues(
                                                  alpha: 0.25,
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '3',
                                          style: CustomTextStyles
                                              .neueMontrealRegular24
                                              .copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          'Badges',
                                          style: CustomTextStyles
                                              .neueMontrealRegular20
                                              .copyWith(
                                                color: Colors.white.withValues(
                                                  alpha: 0.25,
                                                ),
                                              ),
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
                        Row(
                          spacing: 8.w,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ShaderMask(
                              child: Assets.icons.arrowHeadDashed.svg(
                                width: 12.w,
                              ),
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  colors: [
                                    Color(0xFF6A30C9),
                                    Color(0xFF506DDB),
                                  ],
                                  begin: Alignment(-1, 0),
                                  end: Alignment(0.75, -1),
                                ).createShader(bounds);
                              },
                            ),
                            ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  colors: [
                                    Color(0xFF6A30C9),
                                    Color(0xFF506DDB),
                                  ],
                                  begin: Alignment(-1, 0),
                                  end: Alignment(0.75, -1),
                                ).createShader(bounds);
                              },
                              child: Text(
                                '1 Badge Minted',
                                style: DLSTextStyle.labelSmall.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.w,
                          ),
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
                                color: Color(
                                  0xFF375DFB,
                                ).withValues(alpha: 0.08),
                                offset: Offset(0, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8.w,
                            children: [
                              Text(
                                'Earn More Badges & Xp',
                                style: DLSTextStyle.labelMedium.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Assets.icons.arrowHeadDashed.svg(width: 10.w),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Row(
                          spacing: 20.w,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80.h,
                              width: 120.w,
                              child: SfRadialGauge(
                                axes: [
                                  RadialAxis(
                                    showLabels: false,
                                    showTicks: false,
                                    showFirstLabel: false,
                                    showLastLabel: false,
                                    canScaleToFit: true,
                                    startAngle: 180,
                                    endAngle: 0,
                                    axisLineStyle: AxisLineStyle(
                                      thickness: 0.125,
                                      color: DLSColors.orangeLight,
                                      thicknessUnit: GaugeSizeUnit.factor,
                                      cornerStyle: CornerStyle.bothCurve,
                                    ),
                                    pointers: [
                                      RangePointer(
                                        value: 50,
                                        width: 0.125,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Color(0xFFFEA06D),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 132.w,
                              child: Column(
                                spacing: 6.h,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Current Level',
                                          style: CustomTextStyles
                                              .neueMontrealRegular12
                                              .copyWith(
                                                color: Colors.white.withValues(
                                                  alpha: 0.5,
                                                ),
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '6',
                                        style: CustomTextStyles
                                            .neueMontrealMedium12
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 4.w,
                                    children: [
                                      Assets.images.coin.image(width: 24.w),
                                      Text(
                                        '435',
                                        style: CustomTextStyles
                                            .neueMontrealRegular20
                                            .copyWith(color: Colors.white),
                                      ),
                                      Text(
                                        '/500 Xp',
                                        style: CustomTextStyles
                                            .neueMontrealRegular20
                                            .copyWith(
                                              color: Colors.white.withValues(
                                                alpha: 0.25,
                                              ),
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Digital Identity
            // DigitalIdentity(),
            // Impact Score
            // ImpactScore(),
            // XP & Badges
            // BadgesSocialsList(),
            // XPBadgesComponent(),
            // Leaderboard(),
            // InviationList(),
            // invitationDialogWidget(),
            // invitationDetailDialogWidget(),
          ],
        ),
      ),
    );
  }

  Widget invitationDialogWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 40.h),
      padding: EdgeInsets.all(DLSSizing.xSmall),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            offset: const Offset(0, 0),
            blurRadius: 120,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.w, right: 2.w),
                  child: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: DLSColors.primaryBase,
                      foregroundColor: Colors.white,
                      fixedSize: Size(44.w, 44.w),
                    ),
                    icon: Icon(
                      FontAwesomeIcons.solidCircleXmark,
                      color: Colors.white,
                      size: 20.w,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 1.sw - ((2 * 12.w) + (2 * DLSSizing.xSmall) + 18.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.r),
                            topRight: Radius.circular(32.r),
                          ),
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: CurveTopClipper(),
                      child: Container(
                        height: 36.h,
                        width: 36.h,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: DLSSizing.s4xSmall,
              bottom: DLSSizing.s2xSmall,
              left: DLSSizing.s2xSmall,
              right: DLSSizing.s2xSmall,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32.r),
                bottomLeft: Radius.circular(32.r),
                bottomRight: Radius.circular(32.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Invite Friends',
                  style: DLSTextStyle.titleH3.copyWith(
                    color: Color(0xFF1F2937),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                RichText(
                  text: TextSpan(
                    text: 'You have ',
                    children: [
                      TextSpan(
                        text: '5 Invitation codes',
                        style: DLSTextStyle.paragraphMedium.copyWith(
                          color: Color(0xFF4B5563),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' left'),
                    ],
                    style: DLSTextStyle.paragraphMedium.copyWith(
                      color: Color(0xFF4B5563),
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.all(DLSSizing.xSmall),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F5F8),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              offset: const Offset(0, 4),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Column(
                          spacing: 12.h,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F5F8),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                spacing: 4.h,
                                children: [
                                  Text(
                                    'Invitation Code:',
                                    style: DLSTextStyle.labelSmall.copyWith(
                                      color: DLSColors.textSub500,
                                    ),
                                  ),
                                  Text(
                                    'FRX9L2QA',
                                    style: DLSTextStyle.labelMedium.copyWith(
                                      color: DLSColors.textSub500,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              spacing: 8.w,
                              children: [
                                Expanded(
                                  child: CustomButtonWidget(
                                    onPressed: () {},
                                    style: CustomButtonStyle.stroke,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    prefixIcon: FontAwesomeIcons.copy,
                                    prefixPadding: 8.w,
                                    label: 'Copy Link',
                                  ),
                                ),
                                Expanded(
                                  child: CustomButtonWidget(
                                    onPressed: () {},
                                    filledColor: DLSColors.primaryBase,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    prefixIcon: FontAwesomeIcons.share,
                                    prefixPadding: 8.w,
                                    label: 'Share Link',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 8.h);
                    },
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget invitationDetailDialogWidget() {
    final List<Map<String, dynamic>> shareList = [
      {'icon': Assets.images.logoTelegram, 'title': 'Telegram'},
      {'icon': Assets.images.logoFacebook, 'title': 'Facebook'},
      {'icon': Assets.images.logoX, 'title': 'X'},
      {'icon': Assets.images.logoDiscord, 'title': 'Discord'},
      {'icon': Assets.images.logoWhatsapp, 'title': 'WhatsApp'},
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 40.h),
      padding: EdgeInsets.all(DLSSizing.xSmall),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            offset: const Offset(0, 0),
            blurRadius: 120,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.w, right: 2.w),
                  child: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: DLSColors.primaryBase,
                      foregroundColor: Colors.white,
                      fixedSize: Size(44.w, 44.w),
                    ),
                    icon: Icon(
                      FontAwesomeIcons.solidCircleXmark,
                      color: Colors.white,
                      size: 20.w,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 1.sw - ((2 * 12.w) + (2 * DLSSizing.xSmall) + 18.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.r),
                            topRight: Radius.circular(32.r),
                          ),
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: CurveTopClipper(),
                      child: Container(
                        height: 36.h,
                        width: 36.h,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: DLSSizing.s4xSmall,
              bottom: DLSSizing.s2xSmall,
              left: DLSSizing.s2xSmall,
              right: DLSSizing.s2xSmall,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32.r),
                bottomLeft: Radius.circular(32.r),
                bottomRight: Radius.circular(32.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Invite Friends',
                  style: DLSTextStyle.titleH3.copyWith(
                    color: Color(0xFF1F2937),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                RichText(
                  text: TextSpan(
                    text: 'You have ',
                    children: [
                      TextSpan(
                        text: '5 Invitation codes',
                        style: DLSTextStyle.paragraphMedium.copyWith(
                          color: Color(0xFF4B5563),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' left'),
                    ],
                    style: DLSTextStyle.paragraphMedium.copyWith(
                      color: Color(0xFF4B5563),
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(top: 24.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F5F8),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    spacing: 4.h,
                    children: [
                      Text(
                        'Referral Code',
                        style: DLSTextStyle.labelMedium.copyWith(
                          color: DLSColors.textSub500,
                        ),
                      ),
                      Text(
                        'FRX9L2QA',
                        style: DLSTextStyle.titleH4.copyWith(
                          color: DLSColors.textMain900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            padding: EdgeInsets.all(DLSSizing.small.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Share Invitation Code',
                  style: DLSTextStyle.titleH4.copyWith(
                    color: Color(0xFF1F2937),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Share your referral and earn your good karma.',
                  style: DLSTextStyle.paragraphMedium.copyWith(
                    color: Color(0xFF4B5563),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8.h,
                  children: [
                    Text(
                      'Invite via Email',
                      style: DLSTextStyle.labelMedium.copyWith(
                        color: DLSColors.textMain900,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: DLSColors.strokeSoft200),
                      ),
                      child: Row(
                        children: [
                          // Email icon
                          Padding(
                            padding: EdgeInsets.only(left: 14.5.w, right: 8.w),
                            child: Icon(
                              FontAwesomeIcons.envelope,
                              color: DLSColors.iconSoft400,
                              size: 20.w,
                            ),
                          ),
                          // Text field
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                hintText: 'hello@alignui.com',
                                hintStyle: DLSTextStyle.paragraphSmall.copyWith(
                                  color: DLSColors.textSoft400,
                                ),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: DLSTextStyle.paragraphSmall,
                            ),
                          ),
                          // Invite button
                          Padding(
                            padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DLSColors.primaryBase,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 8.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                'Invite',
                                style: DLSTextStyle.labelSmall.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8.h,
                  children: [
                    Text(
                      'Share referral link',
                      style: DLSTextStyle.labelMedium.copyWith(
                        color: DLSColors.textMain900,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: DLSColors.strokeSoft200),
                      ),
                      child: Row(
                        children: [
                          // Text field
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                hintText:
                                    'https://foru.ai/ref?code=REFMOCKLINK',
                                hintStyle: DLSTextStyle.paragraphSmall.copyWith(
                                  color: DLSColors.textSoft400,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 16.w),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: DLSTextStyle.paragraphSmall,
                            ),
                          ),
                          // Email icon
                          Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 10.w),
                            child: Icon(
                              FontAwesomeIcons.copy,
                              color: DLSColors.primaryBase,
                              size: 20.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8.h,
                  children: [
                    Text(
                      'Share to',
                      style: DLSTextStyle.labelMedium.copyWith(
                        color: DLSColors.textMain900,
                      ),
                    ),
                    SizedBox(
                      height: 84.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = shareList[index];
                          return Column(
                            spacing: 8.h,
                            children: [
                              (item['icon'] as AssetGenImage).image(
                                width: 56.w,
                                height: 56.w,
                              ),
                              Text(
                                item['title'],
                                style: DLSTextStyle.labelMedium.copyWith(
                                  color: DLSColors.textSub500,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 20.w);
                        },
                        itemCount: shareList.length,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
