import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:untukmu_social_tools/app/controllers/client/client_dio_controller.dart';
import 'package:untukmu_social_tools/app/controllers/storage/app_storage_controller.dart';
import 'package:untukmu_social_tools/app/data/models/response/error_response_model.dart';
import 'package:untukmu_social_tools/app/data/models/response/generic_response_model.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/social_media_auth_result.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/user_token.dart';
import 'package:untukmu_social_tools/app/utils/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInController extends GetxController {
  final AppStorageController appStorageController =
      AppStorageController.instance;
  final ClientDioController clientDioController = ClientDioController.to;

  bool loginLoading = false;

  int currentIndex = 0;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? signUpEmail;

  Future<void> initialization({
    SocialMediaAuthResult? socialMediaAuthResult,
    String? emailKey,
  }) async {
    if (socialMediaAuthResult != null) {
      if (socialMediaAuthResult.googleId != null) {
        switchContent(3);
      } else if (socialMediaAuthResult.twitterId != null) {
        switchContent(4);
      }
    } else if (emailKey != null) {
      await Future.delayed(const Duration(milliseconds: 750));
      switchContent(2);
      await verifyEmail(emailKey: emailKey);
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
          'redirect_url':
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
      loginLoading = false;
      update();
    }
  }

  Future<void> signUpByEmail({
    required String email,
    required String name,
  }) async {
    if (email.trim().isEmpty) {
      CustomSnackbar.showError(message: 'Email is required');
    } else if (name.trim().isEmpty) {
      CustomSnackbar.showError(message: 'Name is required');
    } else {
      Get.overlayContext?.loaderOverlay.show();

      loginLoading = true;
      update();

      try {
        final response = await clientDioController.post(
          '/v1/user-auth/mail/register',
          data: {
            'email': email,
            'redirect_uri':
                'https://0a5748bfb84b.ngrok-free.app/deeplink',
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
          signUpEmail = email;
          switchContent(2);

          emailController.clear();
          nameController.clear();
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
        loginLoading = false;
        update();
      }
    }
  }

  Future<void> verifyEmail({required String emailKey}) async {
    Get.overlayContext?.loaderOverlay.show();

    loginLoading = true;
    update();

    try {
      final response = await clientDioController.post(
        '/v1/user-auth/mail/register/verify',
        data: {'key': emailKey},
      );

      debugPrint('response $response');

      final GenericResponseModel<UserToken> responseModel =
          GenericResponseModel.fromJson(
            response.data,
            (data) => UserToken.fromJson(data),
          );

      if (responseModel.isSuccess) {
        appStorageController.saveUserToken(userToken: responseModel.data!);
        switchContent(3);
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
      loginLoading = false;
      update();
    }
  }

  Future<void> connectTwitter() async {
    Get.overlayContext?.loaderOverlay.show();

    loginLoading = true;
    update();

    try {
      final response = await clientDioController.get(
        '/v1/twitter/connect?redirect_uri=https://0a5748bfb84b.ngrok-free.app/deeplink',
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
