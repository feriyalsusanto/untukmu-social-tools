import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/identifi_score_controller.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/impact_score_controller.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/navigation_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.put(ImpactScoreController());
    Get.put(IdentifiScoreController());
  }
}
