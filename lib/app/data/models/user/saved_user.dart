import 'package:untukmu_social_tools/app/data/models/twitter/user_token.dart';

class SavedUser {
  // Twitter account
  final UserToken? userToken;
  final String? connectDate;

  SavedUser({this.userToken, this.connectDate});

  @override
  String toString() {
    return 'SavedUser(userToken: $userToken, connectDate: $connectDate)';
  }
}
