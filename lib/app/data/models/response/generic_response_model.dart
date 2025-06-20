class GenericResponseModel<T> {
  final int code;
  final String message;
  final T? data;
  final String? timestamp;
  final String? version;

  const GenericResponseModel({
    required this.code,
    required this.message,
    this.data,
    this.timestamp,
    this.version,
  });

  // Factory constructor for successful responses
  factory GenericResponseModel.success({
    required T data,
    String message = 'Success',
    int code = 200,
    String? timestamp,
    String? version,
  }) {
    return GenericResponseModel<T>(
      code: code,
      message: message,
      data: data,
      timestamp: timestamp,
      version: version,
    );
  }

  // Factory constructor for error responses
  factory GenericResponseModel.error({
    required String message,
    int code = 400,
    String? timestamp,
    String? version,
  }) {
    return GenericResponseModel<T>(
      code: code,
      message: message,
      data: null,
      timestamp: timestamp,
      version: version,
    );
  }

  // Factory constructor from JSON
  factory GenericResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    return GenericResponseModel<T>(
      code: json['code'] as int,
      message: json['message'] as String,
      data:
          json['data'] != null && fromJsonT != null
              ? fromJsonT(json['data'])
              : json['data'] as T?,
      timestamp: json['timestamp'] as String?,
      version: json['version'] as String?,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson([Map<String, dynamic> Function(T)? toJsonT]) {
    return {
      'code': code,
      'message': message,
      'data': data != null && toJsonT != null ? toJsonT(data as T) : data,
      if (timestamp != null) 'timestamp': timestamp,
      if (version != null) 'version': version,
    };
  }

  // Convenience getters
  bool get isSuccess => code >= 200 && code < 300;
  bool get isError => !isSuccess;
  bool get hasData => data != null;

  // Copy with method for immutability
  GenericResponseModel<T> copyWith({
    int? code,
    String? message,
    T? data,
    String? timestamp,
    String? version,
  }) {
    return GenericResponseModel<T>(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
      timestamp: timestamp ?? this.timestamp,
      version: version ?? this.version,
    );
  }

  @override
  String toString() {
    return 'GenericResponseModel(code: $code, message: $message, data: $data, timestamp: $timestamp, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GenericResponseModel<T> &&
        other.code == code &&
        other.message == message &&
        other.data == data &&
        other.timestamp == timestamp &&
        other.version == version;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        message.hashCode ^
        data.hashCode ^
        timestamp.hashCode ^
        version.hashCode;
  }
}
