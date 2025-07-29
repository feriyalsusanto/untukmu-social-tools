import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/modules/signin/controllers/input_email_controller.dart';
import 'package:untukmu_social_tools/app/modules/signin/controllers/sign_in_controller.dart';

class SignInBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(InputEmailController());
  }
}
