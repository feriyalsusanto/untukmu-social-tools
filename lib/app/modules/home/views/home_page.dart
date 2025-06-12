import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/controllers/twitter_sdk/twitter_sdk_controller.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/navigation_controller.dart';
import 'package:untukmu_social_tools/app/modules/home_opportunity/views/home_opportunity_page.dart';
import 'package:untukmu_social_tools/app/modules/home_passport/views/home_passport_page.dart';

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
      backgroundColor: Color(0xFFF9FAFB),
      endDrawer: CustomEndDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile Passport',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    icon: Icon(FontAwesomeIcons.trophy),
                    iconSize: 18,
                    splashRadius: 10,
                    tooltip: 'XP & Badges',
                  ),
                ],
              ),
              Card(
                elevation: 0,
                borderOnForeground: true,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Color(0xFFE5E7EB)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ProfileInfo(),
                ),
              ),
              ImpactScoreChart(),
              SizedBox(height: 8),
              GetBuilder<NavigationController>(
                builder: (controller) {
                  return Column(
                    spacing: 16,
                    children: [
                      TabBar(
                        onTap:
                            (index) =>
                                controller.changeIndex(activeIndex: index),
                        controller: tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.passport, size: 16),
                                Text('Passport'),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.satelliteDish, size: 16),
                                Text('Opportunities'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      getCurrentPage(controller.currentIndex),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
