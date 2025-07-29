class ErrorResponseModel {
  final String? message;
  final String? error;
  final int? code;
  final String? timestamp;
  final String? version;

  ErrorResponseModel({
    this.message,
    this.error,
    this.code,
    this.timestamp,
    this.version,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      message: json['message'],
      error: json['error'],
      code: json['code'],
      timestamp: json['timestamp'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'error': error,
      'code': code,
      'timestamp': timestamp,
      'version': version,
    };
  }

  @override
  String toString() {
    return 'ErrorResponseModel(message: $message, error: $error, code: $code, timestamp: $timestamp, version: $version)';
  }
}
