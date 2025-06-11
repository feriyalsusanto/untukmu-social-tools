import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/modules/home/controllers/navigation_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
  }
}
