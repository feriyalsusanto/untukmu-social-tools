class TwitterAuthResult {
  final String status;
  final int id;
  final String twitterId;
  final String accessToken;
  final int expiresAt;

  TwitterAuthResult({
    required this.status,
    required this.id,
    required this.twitterId,
    required this.accessToken,
    required this.expiresAt,
  });

  factory TwitterAuthResult.fromParams(Map<String, String> params) {
    return TwitterAuthResult(
      status: params['status'] ?? '',
      id: int.tryParse(params['id'] ?? '0') ?? 0,
      twitterId: params['twitterId'] ?? '',
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
    return 'TwitterAuthResult(status: $status, id: $id, twitterId: $twitterId, accessToken: ${accessToken.substring(0, 10)}..., expiresAt: $expiresAt)';
  }
}
