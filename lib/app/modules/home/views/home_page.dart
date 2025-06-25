import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/controllers/twitter_sdk/twitter_sdk_controller.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/navigation_controller.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/passport_switch.dart';
import 'package:untukmu_social_tools/app/modules/home_opportunity/views/home_opportunity_page.dart';
import 'package:untukmu_social_tools/app/modules/home_passport/views/home_passport_page.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/widgets.dart';
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

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    Get.find<TwitterSdkController>().checkUserLoggedIn();
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
      endDrawer: CustomEndDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Your Passport',
                          style: DLSTextStyle.labelMedium.copyWith(
                            color: DLSColors.textMain900.withValues(alpha: 0.5),
                          ),
                        ),
                        Row(
                          spacing: 16.w,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                spacing: 8.h,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:
                                        Assets.images.defaultProfilePicture
                                            .image(),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 8.h,
                                children: [
                                  Row(
                                    spacing: 8.w,
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 14.r,
                                        backgroundColor:
                                            DLSColors.pacificBlueDark,
                                        foregroundColor: DLSColors.iconWhite0,
                                        child: Icon(
                                          FontAwesomeIcons.wallet,
                                          size: 12.w,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          spacing: 4.h,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              'DRX Yield Farmer & Urban Explorer',
                                              style: DLSTextStyle.labelSmall
                                                  .copyWith(
                                                    color:
                                                        DLSColors.textMain900,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(DLSSizing.s2xSmall),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1F5F8),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'Your Ranking',
                                          style: DLSTextStyle.labelMedium
                                              .copyWith(
                                                color: DLSColors.textMain900
                                                    .withValues(alpha: 0.5),
                                              ),
                                        ),
                                        SizedBox(height: 4.h),
                                        RichText(
                                          text: TextSpan(
                                            text: '# ',
                                            style: DLSTextStyle.labelLarge
                                                .copyWith(
                                                  color: DLSColors.textMain900
                                                      .withValues(alpha: 0.25),
                                                ),
                                            children: [
                                              TextSpan(
                                                text: 'Unranked',
                                                style: DLSTextStyle.labelLarge
                                                    .copyWith(
                                                      color:
                                                          DLSColors.textMain900,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                DLSColors.bgStrong900,
                                            foregroundColor: DLSColors.bgWhite0,
                                            elevation: 0,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: DLSSizing.xSmall,
                                              vertical: DLSSizing.s3xSmall,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    DLSSizing.radiusFull,
                                                  ),
                                              side: BorderSide(
                                                color: DLSColors.strokeSub300,
                                                width: 1,
                                              ),
                                            ),
                                            minimumSize: Size.zero,
                                            tapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Leaderboard',
                                                  style: DLSTextStyle
                                                      .labelMedium
                                                      .copyWith(
                                                        color:
                                                            DLSColors
                                                                .textWhite0,
                                                      ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Icon(
                                                FontAwesomeIcons.chevronRight,
                                                size: 10.w,
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
                        Container(
                          margin: EdgeInsets.only(top: 12.h),
                          child: SocialMediaButton(
                            onPressed: () {},
                            label: 'Complete Your Profile',
                            darkMode: true,
                            buttonRadius: ButtonRadius.full,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      // color: Color(0xFFF1F5F8),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Impact Score',
                          style: DLSTextStyle.labelLarge.copyWith(
                            color: DLSColors.textMain900.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              PassportSwitch(
                initialValue: true,
                // onChanged: (value) {},
                activeText: 'My Passport',
                inactiveText: 'Opportunities',
                activeIcon: Assets.icons.personFilled,
                inactiveIcon: Assets.icons.clipboardText,
              ),
              GetBuilder<NavigationController>(
                builder:
                    (controller) => getCurrentPage(controller.currentIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
