import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:untukmu_social_tools/app/controllers/client/client_dio_controller.dart';
import 'package:untukmu_social_tools/app/controllers/storage/app_storage_controller.dart';
import 'package:untukmu_social_tools/app/data/models/response/generic_response_model.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/twitter_auth_result.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInController extends GetxController {
  final AppStorageController appStorageController =
      AppStorageController.instance;
  final ClientDioController clientDioController = ClientDioController.to;

  bool loginLoading = false;

  int currentIndex = 0;

  Future<void> initialization({TwitterAuthResult? twitterAuthResult}) async {
    if (twitterAuthResult != null) {
      switchContent(1);
    }
  }

  void switchContent(int index) {
    currentIndex = index;
    update();
  }

  Future<void> loginByX() async {
    Get.overlayContext?.loaderOverlay.show();

    loginLoading = true;
    update();

    try {
      final response = await clientDioController.get(
        '/v1/user-auth/twitter',
        queryParameters: {
          'redirect_uri':
              'https://9df4-2001-448a-50a0-797f-d1ec-4328-ce58-df2a.ngrok-free.app/deeplink',
        },
      );

      debugPrint('response $response');

      final GenericResponseModel responseModel = GenericResponseModel.fromJson(
        response.data,
        (data) => data as String,
      );

      if (responseModel.isSuccess) {
        final String url = responseModel.data;
        if (!await launchUrl(Uri.parse(url))) {
          Get.snackbar(
            'Error',
            'Could not launch $url',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
      } else {
        Get.snackbar(
          'Error',
          responseModel.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint('error: $e');
    } finally {
      Get.overlayContext?.loaderOverlay.hide();
      loginLoading = false;
      update();
    }
  }

  Future<void> loginByGoogle() async {
    Get.overlayContext?.loaderOverlay.show();

    loginLoading = true;
    update();

    try {
      final response = await clientDioController.get(
        '/v1/user-auth/google',
        queryParameters: {
          'redirect_uri':
              'https://9df4-2001-448a-50a0-797f-d1ec-4328-ce58-df2a.ngrok-free.app/deeplink',
        },
      );

      debugPrint('response $response');

      final GenericResponseModel responseModel = GenericResponseModel.fromJson(
        response.data,
        (data) => data as String,
      );

      if (responseModel.isSuccess) {
        final String url = responseModel.data;
        if (!await launchUrl(Uri.parse(url))) {
          Get.snackbar(
            'Error',
            'Could not launch $url',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
      } else {
        Get.snackbar(
          'Error',
          responseModel.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint('error: $e');
    } finally {
      Get.overlayContext?.loaderOverlay.hide();
      loginLoading = false;
      update();
    }
  }
}
