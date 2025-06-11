import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/navigation_controller.dart';
import 'package:untukmu_social_tools/app/modules/home_opportunity/views/home_opportunity_page.dart';
import 'package:untukmu_social_tools/app/modules/home_passport/views/home_passport_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigationController = Get.find<NavigationController>();

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
      backgroundColor: Color(0xFFF5F5F5),
      bottomNavigationBar: GetBuilder<NavigationController>(
        builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (index) => controller.changeIndex(activeIndex: index),
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.passport),
                label: 'My Passport',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.satelliteDish),
                label: 'Opportunities',
              ),
            ],
          );
        },
      ),
      body: GetBuilder<NavigationController>(
        builder: (controller) {
          return getCurrentPage(controller.currentIndex);
        },
      ),
    );
  }
}
