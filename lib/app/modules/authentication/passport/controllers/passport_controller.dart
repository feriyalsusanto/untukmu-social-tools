import 'package:flutter/material.dart' show debugPrint;
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:untukmu_social_tools/app/controllers/client/client_dio_controller.dart';
import 'package:untukmu_social_tools/app/data/models/response/generic_response_model.dart';
import 'package:untukmu_social_tools/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class PassportController extends GetxController {
  static final PassportController instance = Get.find<PassportController>();

  final ClientDioController _clientDioController = ClientDioController.to;

  bool loading = false;

  Future<void> continueWithX() async {
    Get.overlayContext?.loaderOverlay.show();

    loading = true;
    update();

    try {
      final response = await _clientDioController.get(
        '/v1/user-auth/twitter',
        queryParameters: {
          'redirect_uri':
              'https://0a5748bfb84b.ngrok-free.app/deeplink',
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
      loading = false;
      update();
    }
  }

  Future<void> continueWithEmail() async {
    Get.toNamed(AppPages.authEmail);
  }
}
