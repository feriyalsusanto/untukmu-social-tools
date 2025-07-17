import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/modules/authentication/passport/controllers/passport_controller.dart';

class AuthPassportBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PassportController());
  }
}
