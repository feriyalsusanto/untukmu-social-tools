import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomSnackbar {
  static void showError({required String message, String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: DLSColors.errorBase,
      colorText: DLSColors.textWhite0,
    );
  }
}
