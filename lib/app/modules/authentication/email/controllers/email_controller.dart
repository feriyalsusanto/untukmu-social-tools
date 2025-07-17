import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:untukmu_social_tools/app/controllers/client/client_dio_controller.dart';
import 'package:untukmu_social_tools/app/data/models/response/error_response_model.dart';
import 'package:untukmu_social_tools/app/data/models/response/generic_response_model.dart';
import 'package:untukmu_social_tools/app/utils/custom_snackbar.dart';

enum AuthEmailState { input, verification }

class EmailController extends GetxController {
  static final EmailController instance = Get.find<EmailController>();

  final ClientDioController _clientDioController = ClientDioController.to;

  AuthEmailState state = AuthEmailState.input;
  String email = '';

  bool loading = false;

  Future<void> continueWithEmail({
    String email = '',
    String name = '',
    bool test = false,
  }) async {
    if (test) {
      updateState(state: AuthEmailState.verification);
      return;
    }

    if (email.trim().isEmpty) {
      CustomSnackbar.showError(message: 'Email is required');
    } else if (name.trim().isEmpty) {
      CustomSnackbar.showError(message: 'Name is required');
    } else {
      Get.overlayContext?.loaderOverlay.show();

      loading = true;
      update();

      try {
        final response = await _clientDioController.post(
          '/v1/user-auth/mail/register',
          data: {
            'email': email,
            'redirect_uri': 'https://0a5748bfb84b.ngrok-free.app/deeplink',
            'name': name,
          },
        );

        debugPrint('response $response');

        final GenericResponseModel responseModel =
            GenericResponseModel.fromJson(
              response.data,
              (data) => data as String,
            );

        if (responseModel.isSuccess) {
          this.email = email;

          updateState(state: AuthEmailState.verification);
        } else {
          CustomSnackbar.showError(message: responseModel.message);
        }
      } on DioException catch (e) {
        debugPrint('error: $e');
        ErrorResponseModel errorResponseModel = ErrorResponseModel.fromJson(
          e.response?.data,
        );
        if (errorResponseModel.message != null) {
          CustomSnackbar.showError(message: errorResponseModel.message!);
        }
      } catch (e) {
        debugPrint('error: $e');
      } finally {
        Get.overlayContext?.loaderOverlay.hide();
        loading = false;
        update();
      }
    }
  }

  void updateState({required AuthEmailState state}) {
    this.state = state;
    update();
  }
}
