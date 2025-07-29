import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/controllers/applinks/applinks_controller.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/wallet_list_widget.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/social_media_button.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

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
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: DLSColors.bgWhite0.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        spacing: 4.h,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              // color: Color(0xFFF1F5F8),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  spacing: 8.w,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        spacing: 8.w,
                        children: [
                          Assets.icons.trendUp.svg(width: 16.w),
                          Text(
                            'Badges',
                            style: DLSTextStyle.labelMedium.copyWith(
                              color: DLSColors.textWhite0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(color: Color(0xFFE2E4E9), width: 1),
                      ),
                      child: Row(
                        spacing: 8.w,
                        children: [
                          Assets.icons.chartSuccess.svg(width: 16.w),
                          Text(
                            'NFT',
                            style: DLSTextStyle.labelMedium.copyWith(
                              color: Color(0xFF068AF5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                RecentBadgesWidget(),
              ],
            ),
          ),
          DigitalDNAWidget(),
          WalletListWidget(),
        ],
      ),
    );
  }
}

class DigitalDNAWidget extends StatelessWidget {
  const DigitalDNAWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        // color: Color(0xFFF1F5F8),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your Digital DNA',
            style: DLSTextStyle.labelLarge.copyWith(
              color: DLSColors.textMain900.withValues(alpha: 0.5),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DLSSizing.radius32),
              boxShadow: [DLSShadow.xLargeShadow],
            ),
            child: Column(
              spacing: 16.h,
              children: [
                Assets.images.colorfulSparkle.image(width: 0.5.sw),
                Text(
                  'Get Your Personalized AI Analysis',
                  style: DLSTextStyle.labelLarge.copyWith(
                    color: DLSColors.textMain900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(DLSSizing.xSmall),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F5F8),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'What are your true strengths? Connect your X (Twitter) account and our AI will reveal your unique \'Digital DNA\''
                    'calculate your Impact Score, and start curating AI-powered insights and opportunities perfectly matched to you.',
                    style: DLSTextStyle.labelLarge.copyWith(
                      color: DLSColors.textMain900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: SocialMediaButton(
                    onPressed: () {},
                    label: 'Connect Your X',
                    darkMode: true,
                    buttonRadius: ButtonRadius.full,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecentBadgesWidget extends StatelessWidget {
  const RecentBadgesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Recent Badges',
                  style: DLSTextStyle.labelLarge.copyWith(
                    color: DLSColors.textMain900.withValues(alpha: 0.5),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 120.w, maxWidth: 0.35.sw),
                child: IntrinsicWidth(
                  child: Row(
                    spacing: 4.w,
                    children: [
                      Assets.images.coin.image(width: 20.w),
                      Expanded(
                        child: Column(
                          spacing: 4.h,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildLevelAndXpRow(
                              level: 1,
                              currentXp: 100,
                              maxXp: 500,
                            ),
                            _buildProgressBar(currentXp: 100, maxXp: 500),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            child: CustomDividerWidget(),
          ),
          Row(
            spacing: 8.w,
            children: [
              Expanded(
                child: Row(
                  spacing: 4.w,
                  children: [
                    Assets.icons.sparkleBlue.svg(width: 18.w),
                    Text(
                      'Challenges and Quest',
                      style: DLSTextStyle.labelLarge,
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 2.w,
                children: [
                  Text(
                    'See More',
                    style: DLSTextStyle.labelMedium.copyWith(
                      color: DLSColors.textMain900.withValues(alpha: 0.5),
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.chevronRight,
                    color: DLSColors.iconDisabled300,
                    size: 16.w,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.w,
              crossAxisSpacing: 8.w,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                child: Column(
                  spacing: 4.h,
                  children: [
                    Assets.images.badgesDefault.image(
                      width: 0.25.sw,
                      color: DLSColors.textMain900.withValues(alpha: 0.25),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: DLSColors.textMain900.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Column(
                          spacing: 4.h,
                          children: [
                            Text('Badge Name', style: DLSTextStyle.labelMedium),
                            Text(
                              'Reach 0/1,000 score',
                              style: DLSTextStyle.labelSmall.copyWith(
                                color: DLSColors.textMain900.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4.h),
                              child: Row(
                                spacing: 4.w,
                                children: [
                                  Expanded(
                                    child: Row(
                                      spacing: 4.w,
                                      children: [
                                        Assets.images.coin.image(width: 14.w),
                                        Text(
                                          '+25',
                                          style: DLSTextStyle.labelMedium
                                              .copyWith(
                                                color: DLSColors.textMain900
                                                    .withValues(alpha: 0.5),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      spacing: 4.w,
                                      children: [
                                        Transform.rotate(
                                          angle: 90,
                                          child: Assets.images.chromeStar.image(
                                            width: 14.w,
                                          ),
                                        ),
                                        Text(
                                          '+5',
                                          style: DLSTextStyle.labelMedium
                                              .copyWith(
                                                color: DLSColors.textMain900
                                                    .withValues(alpha: 0.5),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLevelAndXpRow({
    required int level,
    required int currentXp,
    required int maxXp,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'LVL ',
                    style: DLSTextStyle.labelSmall.copyWith(
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                  TextSpan(
                    text: '$level',
                    style: DLSTextStyle.labelSmall.copyWith(
                      color: DLSColors.textMain900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$currentXp ',
                    style: DLSTextStyle.labelSmall.copyWith(
                      color: DLSColors.textMain900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '/$maxXp Xp',
                    style: DLSTextStyle.labelSmall.copyWith(
                      color: DLSColors.textMain900.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar({required int currentXp, required int maxXp}) {
    final progress = currentXp / maxXp;

    return ClipRRect(
      borderRadius: BorderRadius.circular(5.h / 2.r),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: DLSColors.bgSoft200,
        valueColor: AlwaysStoppedAnimation<Color>(DLSColors.primaryBase),
        minHeight: 5.h,
      ),
    );
  }
}
