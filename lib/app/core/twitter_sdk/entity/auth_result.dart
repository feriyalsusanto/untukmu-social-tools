import 'dart:core';

import 'package:untukmu_social_tools/app/core/twitter_sdk/entity/user.dart';
import 'package:untukmu_social_tools/app/core/twitter_sdk/src/twitter_login_core.dart';

/// The result when the Twitter login flow has completed.
/// The login methods always return an instance of this class.
class AuthResult {
  /// constructor
  AuthResult({
    String? authToken,
    String? authTokenSecret,
    required TwitterLoginStatus status,
    String? errorMessage,
    User? user,
  }) : _authToken = authToken,
       _authTokenSecret = authTokenSecret,
       _status = status,
       _errorMessage = errorMessage,
       _user = user;

  /// The access token for using the Twitter APIs
  final String? _authToken;

  //// The access token secret for using the Twitter APIs
  final String? _authTokenSecret;

  /// The status after a Twitter login flow has completed
  final TwitterLoginStatus? _status;

  /// The error message when the log in flow completed with an error
  final String? _errorMessage;

  /// Twitter Account user Info.
  final User? _user;

  String? get authToken => _authToken;
  String? get authTokenSecret => _authTokenSecret;
  TwitterLoginStatus? get status => _status;
  String? get errorMessage => _errorMessage;
  User? get user => _user;
}
