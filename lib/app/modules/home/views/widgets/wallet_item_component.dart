import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shadex/shadex.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class WalletItemComponent extends StatelessWidget {
  const WalletItemComponent({super.key, required this.isPrimary});

  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DLSSizing.radius24),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withValues(alpha: 0)],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        gradient: RadialGradient(
          colors: [
            Colors.white.withValues(alpha: 0),
            Colors.white.withValues(alpha: 0.25),
          ],
          stops: [0, 1],
          center: Alignment.center,
          focal: Alignment.center,
          radius: 1.25,
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.h, left: 16.w),
            height: 100.w,
            width: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 48,
                  spreadRadius: 4,
                  color: Color(isPrimary ? 0x998358EF : 0x99FFFFFF),
                  offset: Offset(0, 16),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(8.w, 16.w, 32.w, 16.w),
                child: Text(
                  isPrimary ? 'Primary' : '',
                  style: DLSTextStyle.titleH3.copyWith(
                    color: DLSColors.textWhite0,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 16.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(DLSSizing.radius24),
                    color: DLSColors.bgWhite0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 64.w),
                        child: Text(
                          'Foru',
                          style: DLSTextStyle.labelLarge.copyWith(
                            color: DLSColors.textMain900,
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        spacing: 4.w,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Address',
                            style: DLSTextStyle.labelLarge.copyWith(
                              color: DLSColors.textMain900.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                          Text(
                            '0x6sw738...',
                            style: DLSTextStyle.titleH3.copyWith(
                              color: DLSColors.textMain900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      if (!isPrimary)
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 10.h,
                            ),
                            backgroundColor: Colors.white,
                            foregroundColor: DLSColors.bgStrong900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              side: BorderSide(
                                color: DLSColors.bgStrong900.withValues(
                                  alpha: 0.25,
                                ),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            spacing: 8.w,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Disconnect',
                                style: DLSTextStyle.labelMedium.copyWith(
                                  color: DLSColors.bgStrong900,
                                ),
                              ),
                              Assets.icons.disconnectX.svg(
                                width: 8.w,
                                colorFilter: ColorFilter.mode(
                                  DLSColors.bgStrong900,
                                  BlendMode.srcIn,
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
          Container(
            margin: EdgeInsets.only(top: 28.h, left: 24.w),
            child: Shadex(
              child: CircleAvatar(
                radius: 28.r,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 26.r,
                  child: Assets.images.solanaLogo.image(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
