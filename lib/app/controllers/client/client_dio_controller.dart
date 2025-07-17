import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:untukmu_social_tools/app/controllers/storage/app_storage_controller.dart';
import 'package:untukmu_social_tools/app/utils/signature_generator.dart';

class ClientDioController extends GetxController {
  static ClientDioController get to => Get.find();
  late Dio _dio;

  // Observable for connection state
  final isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeDio();
  }

  void _initializeDio() {
    final baseUrl = dotenv.env['URL_API_DEV']!;

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-foru-apikey': dotenv.env['API_KEY_DEV']!,
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );

    // Add logging interceptor in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }

  void setUserAccessToken({required String accessToken}) {
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }

  // Request interceptor
  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final storageController = AppStorageController.instance;
    final user = await storageController.loadUserData();

    if (user != null && user.userToken?.accessToken != null) {
      options.headers['Authorization'] =
          'Bearer ${user.userToken!.accessToken}';
    }

    var timestamp = DateTime.now().millisecondsSinceEpoch;

    options.headers['x-foru-timestamp'] = timestamp;

    var payloadForSignature =
        options.data is FormData
            ? options.path
            : (options.data ?? options.path);

    debugPrint('options.data ${options.data}');
    debugPrint('options.path ${options.path}');

    options.headers['x-foru-signature'] =
        SignatureGenerator.generatePayloadToSignature(
          method: options.method,
          payload: payloadForSignature,
          timestamp: timestamp.toString(),
          isDev: true,
        );

    handler.next(options);
  }

  // Response interceptor
  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle successful response
    isConnected.value = true;
    handler.next(response);
  }

  // Error interceptor
  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      isConnected.value = false;
    }

    // Handle 401 Unauthorized error
    if (error.response?.statusCode == 401) {
      // Refresh token or logout user
      await _handleUnauthorizedError();
    }

    handler.next(error);
  }

  // Generic GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Generic POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Generic PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Generic DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Handle 401 Unauthorized error
  Future<void> _handleUnauthorizedError() async {
    try {
      // final refreshToken = await storage.read(key: 'refresh_token');
      // if (refreshToken != null) {
      //   // Attempt to refresh token
      //   final response = await _dio.post(
      //     '/auth/refresh',
      //     data: {'refresh_token': refreshToken},
      //   );

      //   if (response.statusCode == 200) {
      //     // Save new tokens
      //     await storage.write(
      //       key: 'auth_token',
      //       value: response.data['access_token'],
      //     );
      //     await storage.write(
      //       key: 'refresh_token',
      //       value: response.data['refresh_token'],
      //     );
      //     return;
      //   }
      // }
      // If refresh failed or no refresh token, logout user
      await _logout();
    } catch (e) {
      await _logout();
    }
  }

  // Logout helper
  Future<void> _logout() async {
    // await storage.deleteAll();
    // GoRouter.of(state.Get.context!).pushReplacement('/login');
    // state.Get.toNamed('/auth');
  }

  // Download file
  Future<Response> download(
    String url,
    String savePath, {
    void Function(int, int)? onReceiveProgress,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await _dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Upload file
  Future<Response<T>> upload<T>(
    String path,
    FormData formData, {
    void Function(int, int)? onSendProgress,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: formData,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
