import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untukmu_social_tools/app/controllers/applinks/applinks_controller.dart';
import 'package:untukmu_social_tools/app/controllers/twitter_sdk/twitter_sdk_controller.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/social_media_button.dart';
import 'package:untukmu_social_tools/app/utils/date_util.dart';

part 'widgets/connected_platform_item.dart';
part 'widgets/connected_wallet_item.dart';
part 'widgets/custom_end_drawer.dart';
part 'widgets/digital_dna.dart';
part 'widgets/impact_score_breakdown.dart';
part 'widgets/impact_score_chart.dart';
part 'widgets/profile_info.dart';
part 'widgets/social_media_list.dart';
part 'widgets/web3_wallet_info.dart';

class HomePassportPage extends StatefulWidget {
  const HomePassportPage({super.key});

  @override
  State<HomePassportPage> createState() => _HomePassportPageState();
}

class _HomePassportPageState extends State<HomePassportPage> {
  final ApplinksController applinksController = Get.find<ApplinksController>();

  final List<SocialMediaButton> socialMediaButtons = [
    // SocialMediaButton(icon: FontAwesomeIcons.twitter, isConnected: false),
  ];

  late final List<Map<String, dynamic>> impactScoreBreakdown;

  @override
  void initState() {
    impactScoreBreakdown = [
      {
        'title': 'Reach',
        'value': Random().nextInt(1000),
        'detail':
            '${Random().nextInt(100)}k followers, ~${Random().nextInt(1000)} avg impressions',
        'icon': FontAwesomeIcons.volumeHigh,
      },
      {
        'title': 'Engagement',
        'value': Random().nextInt(1000),
        'detail': '${Random().nextInt(100)}% engagement rate on Twitter',
        'icon': FontAwesomeIcons.heart,
      },
      {
        'title': 'Credibility',
        'value': Random().nextInt(1000),
        'detail': 'Retweeted by @SomniaWorld, listed in JakartaCrypto',
        'icon': FontAwesomeIcons.check,
      },
      {
        'title': 'Community',
        'value': Random().nextInt(1000),
        'detail':
            'DRX LP detected in top 15% wallets; ForU testnet activity verified',
        'icon': FontAwesomeIcons.users,
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Text(
              'Connected Platforms',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GetBuilder<TwitterSdkController>(
              init: Get.find<TwitterSdkController>(),
              builder: (controller) {
                bool isLoggedIn =
                    controller.twitterToken != null ||
                    controller.twitterUser != null;

                String connectDate = DateUtil.formatDate(
                  controller.twitterConnectDate,
                  format: 'MMM d, yyyy',
                );

                return ConnectedPlatformItem(
                  onTap: () {
                    controller.login();
                  },
                  platformIcon: FontAwesomeIcons.twitter,
                  platformName: 'Twitter',

                  /// TODO: change to actual data, hardcoded
                  // platformUsername: controller.twitterUser?.screenName,
                  platformUsername: '@creativecoder',
                  isLoading: controller.isLoading,
                  isConnected: isLoggedIn,
                  connectDate: connectDate,
                );
              },
            ),
            ConnectedWalletItem(),
          ],
        ),
        ImpactScoreBreakdown(impactScoreBreakdown: impactScoreBreakdown),
        DigitalDNA(),
        Web3WalletInfo(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    Get.find<TwitterSdkController>().reset(rebuild: false);
  }
}
