import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/controllers/client/client_dio_controller.dart';
import 'package:untukmu_social_tools/app/controllers/storage/app_storage_controller.dart';
import 'package:untukmu_social_tools/app/data/models/user/saved_user.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find<UserController>();
  AppStorageController storageController = AppStorageController.instance;

  RxBool isLoading = false.obs;

  Rx<SavedUser?> savedUser = Rx<SavedUser?>(null);
  RxBool isLoggedIn = false.obs;

  Future<void> checkUserLoggedIn({Function()? onUserLoggedIn}) async {
    isLoading.value = true;
    final user = await storageController.loadUserData();
    if (user != null) {
      savedUser.value = user;
      isLoggedIn.value = true;
      ClientDioController.to.setUserAccessToken(
        accessToken: user.userToken!.accessToken,
      );
      onUserLoggedIn?.call();
    }
    isLoading.value = false;
  }
}
