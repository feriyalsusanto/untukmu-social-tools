import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/modules/authentication/email/controllers/email_controller.dart';

class AuthEmailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EmailController());
  }
}
