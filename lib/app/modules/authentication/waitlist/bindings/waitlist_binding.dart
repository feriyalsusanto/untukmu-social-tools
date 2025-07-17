import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/modules/authentication/waitlist/controllers/waitlist_controller.dart';

class AuthWaitlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WaitlistController>(WaitlistController());
  }
}
