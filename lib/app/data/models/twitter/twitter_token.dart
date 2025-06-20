class TwitterToken {
  final String twitterId;
  final String accessToken;
  final int expiresAt;

  TwitterToken({
    required this.twitterId,
    required this.accessToken,
    required this.expiresAt,
  });

  factory TwitterToken.fromJson(Map<String, dynamic> json) {
    return TwitterToken(
      twitterId: json['twitterId'],
      accessToken: json['accessToken'],
      expiresAt: json['expiresAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'twitterId': twitterId,
      'accessToken': accessToken,
      'expiresAt': expiresAt,
    };
  }

  @override
  String toString() {
    return 'TwitterToken(twitterId: $twitterId, accessToken: $accessToken, expiresAt: $expiresAt)';
  }
}
