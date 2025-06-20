import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untukmu_social_tools/app/core/twitter_sdk/src/utils.dart';

// ignore: avoid_classes_with_only_static_members
class Oauth2 {
  /// get applicatoin Bearer Token.
  ///
  /// https://developer.twitter.com/en/docs/authentication/oauth-2-0/application-only
  static Future<String?> getBearerToken({
    required String apiKey,
    required String apiSecretKey,
  }) async {
    final httpClient = http.Client();
    final res = await httpClient.post(
      Uri.parse(
        'https://api.x.com/oauth2/token',
      ).replace(queryParameters: {'grant_type': 'client_credentials'}),
      headers: <String, String>{
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecretKey'))}',
      },
    );

    final json = jsonDecode(res.body) as Map<String, dynamic>;
    return json.get('access_token');
  }
}
