import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/modules/authentication/profile/controllers/profile_controller.dart';

class AuthProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
