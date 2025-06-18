import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/widgets.dart';
import 'package:untukmu_social_tools/app/utils/crypto_address_generator.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class WalletConnectContent extends StatelessWidget {
  const WalletConnectContent({super.key, required this.onSkipPressed});

  final Function() onSkipPressed;

  @override
  Widget build(BuildContext context) {
    return SignInContent(
      topContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Connect Wallets for More Opportunities',
            style: DLSTextStyle.titleH4,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Connect 1 or more wallets to boost your badge history and unlock airdrops.',
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: DLSColors.textSub500,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            padding: EdgeInsets.all(DLSSizing.s3xSmall),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DLSSizing.radius16),
              color: DLSColors.bgWeak100,
            ),
            child: Column(
              children: [
                ConnectInformation(
                  assetName: Assets.icons.layer.keyName,
                  description:
                      'We check what you\'ve interacted with across Web3 (NFTs, DeFi, testnets).',
                ),
                ConnectInformation(
                  assetName: Assets.icons.star.keyName,
                  description:
                      'The more wallets you connect, the deeper your reputation — and better your matches.',
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(DLSSizing.s2xSmall),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(DLSSizing.radius16),
                      border: Border.all(color: DLSColors.strokeSoft200),
                      color: DLSColors.bgWeak100,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.icons.wallet.keyName,
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                  DLSColors.iconStrong900,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                CryptoAddressGenerator.generateSecretAddress(),
                                style: DLSTextStyle.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.circleXmark,
                          color: DLSColors.iconStrong900,
                          size: 16,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemCount: 2,
              ),
              SizedBox(height: 12),
              SocialMediaButton(
                onPressed: () {},
                labelIcon: FontAwesomeIcons.plus,
                label: 'Add Another Wallet',
              ),
            ],
          ),
          SizedBox(height: 32),
          Column(
            spacing: 12,
            children: [
              SocialMediaButton(
                onPressed: () {},
                darkMode: true,
                assetName: Assets.icons.wallet.keyName,
                label: 'Continue',
              ),
              SocialMediaButton(
                onPressed: onSkipPressed,
                label: 'Skip for Now',
              ),
            ],
          ),
        ],
      ),
      bottomContent: Column(
        spacing: 4,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: DLSSizing.xSmall),
            child: Column(
              spacing: 12,
              children: [
                Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Why we ask for wallets',
                      style: DLSTextStyle.paragraphSmall.copyWith(
                        color: DLSColors.textWhite0,
                        decoration: TextDecoration.underline,
                        decorationColor: DLSColors.textWhite0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SvgPicture.asset(
                      Assets.icons.stashQuestion.keyName,
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        DLSColors.textWhite0,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DLSTextStyle.paragraphSmall.copyWith(
                      color: DLSColors.textDisabled300,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Wallets are read-only. We never access your funds. ',
                      ),
                      TextSpan(
                        text: 'Learn more',
                        style: DLSTextStyle.paragraphSmall.copyWith(
                          color: DLSColors.bgWhite0,
                          decoration: TextDecoration.underline,
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
    );
  }

  OutlineInputBorder get inputBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(DLSSizing.radius16),
    borderSide: BorderSide(color: DLSColors.strokeSoft200, width: 1),
  );
}
