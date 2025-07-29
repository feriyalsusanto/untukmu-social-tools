import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/home/views/widgets/wallet_item_component.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class WalletListWidget extends StatelessWidget {
  const WalletListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: DLSColors.bgStrong900,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 4.w,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Wallet',
                style: DLSTextStyle.labelLarge.copyWith(
                  color: DLSColors.textWhite0.withValues(alpha: 0.5),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 10.h,
                  ),
                  backgroundColor: DLSColors.bgStrong900,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    side: BorderSide(
                      color: Colors.white.withValues(alpha: 0.25),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  spacing: 8.w,
                  children: [
                    Text(
                      'Add Wallet',
                      style: DLSTextStyle.labelMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Assets.icons.arrowHeadDashed.svg(width: 8.w),
                  ],
                ),
              ),
            ],
          ),
          CarouselSlider.builder(
            itemCount: 2,
            itemBuilder: (context, index, realIndex) {
              bool isPrimary = index == 0;
              return WalletItemComponent(isPrimary: isPrimary);
            },
            options: CarouselOptions(
              aspectRatio: 1.4,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
