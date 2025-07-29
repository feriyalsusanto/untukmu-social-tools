class UserToken {
  final String? twitterId;
  final String? googleId;
  final String accessToken;
  final int expiresAt;

  UserToken({
    required this.accessToken,
    required this.expiresAt,
    this.twitterId,
    this.googleId,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      twitterId: json['twitterId'],
      googleId: json['googleId'],
      accessToken: json['accessToken'],
      expiresAt: json['expiresAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'twitterId': twitterId,
      'googleId': googleId,
      'accessToken': accessToken,
      'expiresAt': expiresAt,
    };
  }

  @override
  String toString() {
    return 'UserToken(twitterId: $twitterId, googleId: $googleId, accessToken: $accessToken, expiresAt: $expiresAt)';
  }
}
