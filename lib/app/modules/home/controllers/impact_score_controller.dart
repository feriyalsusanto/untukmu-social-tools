import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/controllers/client/client_dio_controller.dart';
import 'package:untukmu_social_tools/app/data/models/impact_score/impact_score_model.dart';
import 'package:untukmu_social_tools/app/data/models/response/generic_response_model.dart';

class ImpactScoreController extends GetxController {
  static ImpactScoreController get instance => Get.find();

  final clientDioController = ClientDioController.to;

  RxBool isLoading = false.obs;

  Rx<ImpactScoreModel?> impactScoreModel = Rx(null);

  Future<void> getImpactScore() async {
    try {
      isLoading.value = true;
      final response = await clientDioController.get('/v1/user/metrics');

      debugPrint('response $response');

      final GenericResponseModel<ImpactScoreModel> responseModel =
          GenericResponseModel.fromJson(
            response.data,
            (data) => ImpactScoreModel.fromJson(data),
          );

      if (responseModel.isSuccess) {
        impactScoreModel.value = responseModel.data;
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
      isLoading.value = false;
      update();
    }
  }
}
