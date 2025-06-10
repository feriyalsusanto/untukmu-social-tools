import 'package:untukmu_social_tools/app/data/models/twitter/twitter_token.dart';
import 'package:untukmu_social_tools/app/data/models/twitter/twitter_user.dart';

class SavedUser {
  // Twitter account
  final TwitterToken? twitterToken;
  final TwitterUser? twitterUser;
  final String? connectDate;

  SavedUser({this.twitterToken, this.twitterUser, this.connectDate});

  @override
  String toString() {
    return 'SavedUser(twitterToken: $twitterToken, twitterUser: $twitterUser, connectDate: $connectDate)';
  }
}
