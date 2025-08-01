// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:untukmu_social_tools/app/core/twitter_sdk/src/signature.dart';

/// Allows a Consumer application to obtain an OAuth Request Token to request user authorization.
const REQUEST_TOKEN_URL = 'https://api.x.com/oauth/request_token';

/// Allows a Consumer application to use an OAuth Request Token to request user authorization.
const AUTHORIZE_URI = 'https://api.x.com/oauth/authorize';

/// Allows a Consumer application to use an OAuth request_token to request user authorization.
const ACCESS_TOKEN_URI = 'https://api.x.com/oauth/access_token';

/// The "Request email addresses from users"
const ACCOUNT_VERIFY_URI =
    'https://api.x.com/1.1/account/verify_credentials.json?include_email=true';

const USER_LOCKUP_URI = 'https://api.x.com/2/users';

///
String? generateAuthHeader(Map<String, dynamic> params) =>
    'OAuth ${params.keys.map((k) => '$k="${Uri.encodeComponent(params[k] as String)}"').join(', ')}';

/// send http request
Future<Map<String, dynamic>>? httpPost(
  String url,
  Map<String, dynamic> params,
  String apiKey,
  String apiSecretKey,
) async {
  try {
    final signature = Signature(
      url: url,
      params: params,
      apiKey: apiKey,
      apiSecretKey: apiSecretKey,
      tokenSecretKey: '',
    );
    params['oauth_signature'] = signature.signatureHmacSha1();
    final header = generateAuthHeader(params);
    final httpClient = http.Client();
    final res = await httpClient.post(
      Uri.parse(url),
      headers: <String, String>{'Authorization': header!},
    );
    if (res.statusCode != 200) {
      throw HttpException('Failed ${res.reasonPhrase}');
    }

    return Uri.splitQueryString(res.body);
  } on Exception {
    rethrow;
  }
}

Future<Map<String, dynamic>> httpGet(
  String url, {
  Map<String, dynamic>? query,
  required Map<String, dynamic> authHeader,
  required String apiKey,
  required String apiSecretKey,
  required String tokenSecret,
}) async {
  try {
    final signature = Signature(
      url: url,
      method: 'GET',
      params: authHeader,
      apiKey: apiKey,
      apiSecretKey: apiSecretKey,
      tokenSecretKey: tokenSecret,
    );
    authHeader['oauth_signature'] = signature.signatureHmacSha1();
    final header = generateAuthHeader(authHeader);
    final httpClient = http.Client();
    // ignore: no_leading_underscores_for_local_identifiers
    final _url = Uri.parse(url).replace(queryParameters: query);
    final res = await httpClient.get(
      _url,
      headers: <String, String>{'Authorization': header!},
    );
    if (res.statusCode != 200) {
      throw HttpException('Failed ${res.reasonPhrase}');
    }

    return jsonDecode(res.body) as Map<String, dynamic>;
  } on Exception {
    rethrow;
  }
}

Future<Map<String, dynamic>> httpGetFromBearerToken(
  String url, {
  Map<String, dynamic>? query,
  required String bearerToken,
}) async {
  try {
    final httpClient = http.Client();
    final res = await httpClient.get(
      Uri.parse(url).replace(queryParameters: query),
      headers: <String, String>{'Authorization': 'Bearer $bearerToken'},
    );
    if (res.statusCode != 200) {
      throw HttpException('Failed ${res.reasonPhrase}');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  } on Exception catch (error) {
    throw Exception(error);
  }
}

Map<String, String?> requestHeader({
  String? apiKey,
  String? oauthToken = '',
  String? redirectURI = '',
  String? oauthVerifier = '',
}) {
  final dtNow = DateTime.now().millisecondsSinceEpoch;
  final params = {
    'oauth_consumer_key': apiKey,
    'oauth_token': oauthToken,
    'oauth_signature_method': 'HMAC-SHA1',
    'oauth_timestamp': (dtNow / 1000).floor().toString(),
    'oauth_nonce': dtNow.toString(),
    'oauth_version': '1.0',
  };
  if (redirectURI?.isNotEmpty ?? true) {
    params.addAll({'oauth_callback': redirectURI});
  }
  if (oauthVerifier?.isNotEmpty ?? true) {
    params.addAll({'oauth_verifier': oauthVerifier});
  }
  return params;
}

String createCryptoRandomString([int length = 32]) {
  final values = List<int>.generate(
    length,
    (i) => Random.secure().nextInt(256),
  );

  return base64Url.encode(values);
}

extension MapExt on Map {
  T? get<T>(String key) => containsKey(key) ? this[key] as T : null;
}
