import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/widgets.dart';
import 'package:untukmu_social_tools/app/routes/app_pages.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class SummaryContent extends StatefulWidget {
  const SummaryContent({super.key});

  @override
  State<SummaryContent> createState() => _SummaryContentState();
}

class _SummaryContentState extends State<SummaryContent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return SignInContent(
      topContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You\'re all set!',
            style: DLSTextStyle.titleH4,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'We\'re building your Profile Passport now.',
            style: DLSTextStyle.paragraphMedium.copyWith(
              color: DLSColors.textSub500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'You\'ll see your influence score, interests, badges, and matched campaigns as soon as your data is analyzed.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: DLSColors.textSoft400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F5F8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Your Passport',
                              style: DLSTextStyle.labelMedium.copyWith(
                                color: DLSColors.textMain900.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Assets.images.defaultProfilePicture.image(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Ethan Mitchell'.split(' ').join('\n'),
                              style: DLSTextStyle.labelLarge.copyWith(
                                color: DLSColors.textMain900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F5F8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                            child: Row(
                              spacing: 8,
                              children: [
                                CircleAvatar(
                                  maxRadius: 18,
                                  backgroundColor: DLSColors.pacificBlueDark,
                                  foregroundColor: DLSColors.iconWhite0,
                                  child: Icon(
                                    FontAwesomeIcons.wallet,
                                    size: 14,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    spacing: 4,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Your Persona',
                                        style: DLSTextStyle.labelMedium
                                            .copyWith(
                                              color: DLSColors.textMain900
                                                  .withValues(alpha: 0.5),
                                            ),
                                      ),
                                      Text(
                                        'DRX Yield Farmer & Urban Explorer',
                                        style: DLSTextStyle.labelSmall.copyWith(
                                          color: DLSColors.textMain900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: DLSColors.bgWhite0,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 4,
                              children: [
                                Text(
                                  'Your Ranking',
                                  style: DLSTextStyle.labelSmall.copyWith(
                                    color: DLSColors.textMain900.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Influence Score loading...',
                                      style: DLSTextStyle.labelSmall.copyWith(
                                        color: DLSColors.textMain900.withValues(
                                          alpha: 0.5,
                                        ),
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    SpinKitFadingCircle(
                                      color: DLSColors.iconSoft400,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F5F8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: DLSColors.bgWhite0,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 4,
                              children: [
                                Text(
                                  'Matched Campaigns',
                                  style: DLSTextStyle.labelSmall.copyWith(
                                    color: DLSColors.textMain900.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Coming Soon',
                                  style: DLSTextStyle.labelSmall.copyWith(
                                    color: DLSColors.textMain900.withValues(
                                      alpha: 0.5,
                                    ),
                                    fontStyle: FontStyle.italic,
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
            ],
          ),
          SizedBox(height: 32),
          SocialMediaButton(
            onPressed: () => Get.offAndToNamed(AppPages.home),
            darkMode: true,
            assetName: Assets.icons.arrowRight.keyName,
            label: 'See My Profile',
            iconPosition: IconPosition.right,
          ),
          SizedBox(height: 12),
          Text(
            'Data analysis in progress. This usually takes less than 30 seconds.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: DLSColors.textSoft400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
