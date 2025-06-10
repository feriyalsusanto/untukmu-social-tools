class TwitterToken {
  final String token;
  final String tokenSecret;

  TwitterToken({required this.token, required this.tokenSecret});

  factory TwitterToken.fromJson(Map<String, dynamic> json) {
    return TwitterToken(token: json['token'], tokenSecret: json['tokenSecret']);
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'tokenSecret': tokenSecret};
  }

  @override
  String toString() {
    return 'TwitterToken(token: $token, tokenSecret: $tokenSecret)';
  }
}
