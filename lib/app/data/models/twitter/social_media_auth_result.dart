class SocialMediaAuthResult {
  final String status;
  final int id;
  final String? twitterId;
  final String? googleId;
  final String accessToken;
  final int expiresAt;

  SocialMediaAuthResult({
    required this.status,
    required this.id,
    this.twitterId,
    this.googleId,
    required this.accessToken,
    required this.expiresAt,
  });

  factory SocialMediaAuthResult.fromParams(Map<String, String> params) {
    return SocialMediaAuthResult(
      status: params['status'] ?? '',
      id: int.tryParse(params['id'] ?? '0') ?? 0,
      twitterId: params['twitterId'] ?? '',
      googleId: params['googleId'] ?? '',
      accessToken: params['accessToken'] ?? '',
      expiresAt: int.tryParse(params['expiresAt'] ?? '0') ?? 0,
    );
  }

  bool get isSuccess => status.toLowerCase() == 'success';
  bool get hasValidToken => accessToken.isNotEmpty;

  DateTime get expiryDate =>
      DateTime.fromMillisecondsSinceEpoch(expiresAt * 1000);
  bool get isTokenExpired => DateTime.now().isAfter(expiryDate);

  @override
  String toString() {
    return 'SocialMediaAuthResult(status: $status, id: $id, twitterId: $twitterId, googleId: $googleId, accessToken: ${accessToken.substring(0, 10)}..., expiresAt: $expiresAt)';
  }
}
