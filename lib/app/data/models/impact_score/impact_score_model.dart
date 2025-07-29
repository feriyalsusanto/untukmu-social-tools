class ImpactScoreModel {
  int? impactScore;
  int? reachScore;
  int? engagementScore;
  int? averageLikes;
  int? averageReplies;
  int? averageRepost;
  int? averageViews;
  int? onchainScore;
  int? lastImpactScore;
  int? lastReachScore;
  int? lastEngagementScore;
  int? lastAverageLikes;
  int? lastAverageReplies;
  int? lastAverageRepost;
  int? lastAverageViews;
  int? lastOnchainScore;
  dynamic changeImpactScore;
  dynamic changeReachScore;
  dynamic changeEngagementScore;
  dynamic changeAverageLikes;
  dynamic changeAverageReplies;
  dynamic changeAverageRepost;
  dynamic changeAverageViews;
  dynamic changeOnchainScore;

  ImpactScoreModel({
    this.impactScore,
    this.reachScore,
    this.engagementScore,
    this.averageLikes,
    this.averageReplies,
    this.averageRepost,
    this.averageViews,
    this.onchainScore,
    this.lastImpactScore,
    this.lastReachScore,
    this.lastEngagementScore,
    this.lastAverageLikes,
    this.lastAverageReplies,
    this.lastAverageRepost,
    this.lastAverageViews,
    this.lastOnchainScore,
    this.changeImpactScore,
    this.changeReachScore,
    this.changeEngagementScore,
    this.changeAverageLikes,
    this.changeAverageReplies,
    this.changeAverageRepost,
    this.changeAverageViews,
    this.changeOnchainScore,
  });

  ImpactScoreModel.fromJson(Map<String, dynamic> json) {
    impactScore = json['impact_score'];
    reachScore = json['reach_score'];
    engagementScore = json['engagement_score'];
    averageLikes = json['average_likes'];
    averageReplies = json['average_replies'];
    averageRepost = json['average_repost'];
    averageViews = json['average_views'];
    onchainScore = json['onchain_score'];
    lastImpactScore = json['last_impact_score'];
    lastReachScore = json['last_reach_score'];
    lastEngagementScore = json['last_engagement_score'];
    lastAverageLikes = json['last_average_likes'];
    lastAverageReplies = json['last_average_replies'];
    lastAverageRepost = json['last_average_repost'];
    lastAverageViews = json['last_average_views'];
    lastOnchainScore = json['last_onchain_score'];
    changeImpactScore = json['change_impact_score'];
    changeReachScore = json['change_reach_score'];
    changeEngagementScore = json['change_engagement_score'];
    changeAverageLikes = json['change_average_likes'];
    changeAverageReplies = json['change_average_replies'];
    changeAverageRepost = json['change_average_repost'];
    changeAverageViews = json['change_average_views'];
    changeOnchainScore = json['change_onchain_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['impact_score'] = impactScore;
    data['reach_score'] = reachScore;
    data['engagement_score'] = engagementScore;
    data['average_likes'] = averageLikes;
    data['average_replies'] = averageReplies;
    data['average_repost'] = averageRepost;
    data['average_views'] = averageViews;
    data['onchain_score'] = onchainScore;
    data['last_impact_score'] = lastImpactScore;
    data['last_reach_score'] = lastReachScore;
    data['last_engagement_score'] = lastEngagementScore;
    data['last_average_likes'] = lastAverageLikes;
    data['last_average_replies'] = lastAverageReplies;
    data['last_average_repost'] = lastAverageRepost;
    data['last_average_views'] = lastAverageViews;
    data['last_onchain_score'] = lastOnchainScore;
    data['change_impact_score'] = changeImpactScore;
    data['change_reach_score'] = changeReachScore;
    data['change_engagement_score'] = changeEngagementScore;
    data['change_average_likes'] = changeAverageLikes;
    data['change_average_replies'] = changeAverageReplies;
    data['change_average_repost'] = changeAverageRepost;
    data['change_average_views'] = changeAverageViews;
    data['change_onchain_score'] = changeOnchainScore;
    return data;
  }
}
