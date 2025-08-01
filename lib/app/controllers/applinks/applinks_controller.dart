import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/controllers/storage/app_storage_controller.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/social_media_auth_result.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/user_token.dart';
import 'package:untukmu_social_tools/app/routes/app_pages.dart';

class ApplinksController extends GetxController {
  late AppLinks _appLinks;
  StreamSubscription? _linkSubscription;

  // Observable variables
  var currentLink = Rxn<Uri>();
  // var linkHistory = <Uri>[].obs;
  var isListening = false.obs;

  // Navigation routes
  final Map<String, String> _routes = {'/home': AppPages.home};

  @override
  void onInit() {
    super.onInit();
    _initAppLinks();
  }

  @override
  void onClose() {
    _linkSubscription?.cancel();
    super.onClose();
  }

  /// Initialize app links
  Future<void> _initAppLinks() async {
    _appLinks = AppLinks();

    // Check if app was launched from a link
    // try {
    //   final initialLink = await _appLinks.getInitialLink();
    //   if (initialLink != null) {
    //     _handleIncomingLink(initialLink);
    //   }
    // } catch (e) {
    //   debugPrint('Failed to get initial link: $e');
    // }

    // Listen for incoming links when app is already running
    _startListening();
  }

  /// Start listening for app links
  void _startListening() {
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        _handleIncomingLink(uri);
      },
      onError: (err) {
        debugPrint('App link error: $err');
        Get.snackbar(
          'Link Error',
          'Failed to process app link: $err',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
    isListening.value = true;
  }

  /// Handle incoming app link
  void _handleIncomingLink(Uri uri) {
    debugPrint('Received app link: $uri');

    // Update current link and add to history
    currentLink.value = uri;

    // Navigate based on the link
    _navigateFromLink(uri);
  }

  /// Navigate to appropriate screen based on link
  Future<void> _navigateFromLink(Uri uri) async {
    final path = uri.path;
    final queryParams = uri.queryParameters;

    debugPrint('Navigating to path: $path with params: $queryParams');

    debugPrint('path.contains(/deeplink) == ${path.contains('/deeplink')}');

    if (path.contains('/deeplink')) {
      debugPrint('processing deeplink');
      String? status =
          queryParams.containsKey('status') ? queryParams['status'] : null;

      debugPrint('status: $status');

      if (status == 'failed') {
        String? message =
            queryParams.containsKey('message') ? queryParams['message'] : null;
        Get.snackbar(
          'Error',
          message ?? 'Failed to process app link',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        final queries = path.split('/');
        final query = queries[queries.length - 1];
        debugPrint('query: $query');

        if (queryParams.containsKey('twitterId') ||
            queryParams.containsKey('googleId')) {
          SocialMediaAuthResult result = SocialMediaAuthResult.fromParams(
            queryParams,
          );
          if (result.isSuccess) {
            await AppStorageController.instance.saveUserToken(
              userToken: UserToken(
                twitterId: result.twitterId,
                googleId: result.googleId,
                accessToken: result.accessToken,
                expiresAt: result.expiresAt,
              ),
            );

            Get.offAllNamed(AppPages.signIn, arguments: {'userToken': result});
          }
        } else if (query.length == 36) {
          Get.offAllNamed(AppPages.signIn, arguments: {'emailKey': query});
        }
      }
    }
  }

  /// Manually test a deep link
  void testDeepLink(String url) {
    try {
      final uri = Uri.parse(url);
      _handleIncomingLink(uri);
    } catch (e) {
      Get.snackbar(
        'Invalid URL',
        'Failed to parse URL: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Clear link history
  void clearHistory() {
    currentLink.value = null;
  }

  /// Get formatted link info
  String getLinkInfo(Uri uri) {
    return 'Path: ${uri.path}\n'
        'Host: ${uri.host}\n'
        'Scheme: ${uri.scheme}\n'
        'Query: ${uri.query.isEmpty ? "None" : uri.query}';
  }

  /// Check if a path is supported
  bool isPathSupported(String path) {
    return _routes.containsKey(path) ||
        path.startsWith('/deeplink/product/') ||
        path.startsWith('/deeplink/user/');
  }
}
