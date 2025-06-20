import 'package:untukmu_social_tools/app/data/models/response/generic_response_model.dart';

extension ResponseModelExtension<T> on GenericResponseModel<T> {
  // Execute a function if response is successful
  GenericResponseModel<R> map<R>(R Function(T) mapper) {
    if (isSuccess && hasData) {
      try {
        return GenericResponseModel<R>.success(
          data: mapper(data as T),
          message: message,
          code: code,
          timestamp: timestamp,
          version: version,
        );
      } catch (e) {
        return GenericResponseModel<R>.error(
          message: 'Mapping error: ${e.toString()}',
          code: 500,
          timestamp: timestamp,
          version: version,
        );
      }
    }
    return GenericResponseModel<R>.error(
      message: message,
      code: code,
      timestamp: timestamp,
      version: version,
    );
  }

  // Execute a function if response is successful, return original if not
  GenericResponseModel<T> onSuccess(void Function(T) callback) {
    if (isSuccess && hasData) {
      callback(data as T);
    }
    return this;
  }

  // Execute a function if response is error
  GenericResponseModel<T> onError(void Function(String, int) callback) {
    if (isError) {
      callback(message, code);
    }
    return this;
  }
}
