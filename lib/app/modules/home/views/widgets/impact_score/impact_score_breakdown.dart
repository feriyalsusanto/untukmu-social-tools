import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/widgets/expandable_widget.dart';
import 'package:untukmu_social_tools/app/modules/widgets/impact_counter.dart';
import 'package:untukmu_social_tools/app/styles/text/custom_text_styles.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class ImpactScoreBreakdown extends StatefulWidget {
  const ImpactScoreBreakdown({super.key});

  @override
  State<ImpactScoreBreakdown> createState() => _ImpactScoreBreakdownState();
}

class _ImpactScoreBreakdownState extends State<ImpactScoreBreakdown>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _expansionController;
  late AnimationController _buttonController;
  late Animation<double> _expansionAnimation;

  @override
  void initState() {
    super.initState();

    // Controller for the list expansion animation
    _expansionController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Controller for the button rotation animation
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // Animation for smooth expansion/collapse
    _expansionAnimation = CurvedAnimation(
      parent: _expansionController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _expansionController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;

      if (isExpanded) {
        _expansionController.forward();
        _buttonController.forward();
      } else {
        _expansionController.reverse();
        _buttonController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0.325.sw + 26.w,
        left: 12.w,
        right: 12.w,
        bottom: 12.w,
      ),
      margin: EdgeInsets.only(top: 0.325.sw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DLSSizing.radius24),
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: 0.75),
            Colors.white.withValues(alpha: 0.5),
          ],
          begin: Alignment(0, -1),
          end: Alignment(0, 0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(DLSSizing.radius24),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withValues(alpha: 0.25),
                Colors.white.withValues(alpha: 0),
                Colors.white.withValues(alpha: 0.25),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.25, 0.5, 0.75, 1],
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                'Impact Score Breakdown',
                style: DLSTextStyle.labelLarge.copyWith(
                  color: DLSColors.textMain900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ImpactScoreItem(icon: Assets.images.iconReachScore, title: 'Reach'),
            SizedBox(height: 4.h),
            SizeTransition(
              sizeFactor: _expansionAnimation,
              child: Column(
                spacing: 4.h,
                children: [
                  ImpactScoreItem(
                    icon: Assets.images.iconEngagementScore,
                    title: 'Engagement',
                  ),
                  ImpactScoreItem(
                    icon: Assets.images.iconOnChainScore,
                    title: 'On Chain',
                  ),
                  ImpactScoreItem(
                    icon: Assets.images.iconCredibilityScore,
                    title: 'Credibility',
                    comingSoon: true,
                  ),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(DLSSizing.radiusFull),
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          DLSSizing.radiusFull,
                        ),
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.05),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Share Achievement',
                              style: CustomTextStyles.lufgaRegular10.copyWith(
                                color: DLSColors.textMain900,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 14.w,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(5.w),
                              child: Assets.images.iconArrowUpTrend.image(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: isExpanded ? 3 : 1,
            //   itemBuilder: (context, index) {
            //     return ImpactScoreItem(title: 'reach');
            //   },
            //   separatorBuilder: (context, index) {
            //     return SizedBox(height: 12.h);
            //   },
            // ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _buttonController,
                  builder: (context, child) {
                    return TextButton(
                      onPressed: _toggleExpansion,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.25),
                        foregroundColor: DLSColors.textSub500,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: DLSRadius.radiusFull,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: Text(
                              isExpanded ? 'See Less' : 'See More',
                              key: ValueKey(isExpanded),
                              style: DLSTextStyle.labelMedium.copyWith(
                                color: DLSColors.textSub500,
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
          ],
        ),
      ),
    );
  }
}

class ImpactScoreItem extends StatefulWidget {
  const ImpactScoreItem({
    super.key,
    required this.title,
    required this.icon,
    this.comingSoon = false,
  });

  final AssetGenImage icon;
  final String title;
  final bool comingSoon;

  @override
  State<ImpactScoreItem> createState() => _ImpactScoreItemState();
}

class _ImpactScoreItemState extends State<ImpactScoreItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpandableWidget(
      headerClickable: !widget.comingSoon,
      onExpansionChanged: (isExpanded) {
        setState(() {
          this.isExpanded = isExpanded;
        });
      },
      showTrailingIcon: false,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DLSSizing.radius32),
        color: widget.comingSoon ? null : Colors.white.withValues(alpha: 0.6),
        border:
            !widget.comingSoon
                ? null
                : Border.all(color: Colors.white.withValues(alpha: 0.5)),
      ),
      header: Container(
        padding: EdgeInsets.all(8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.icon.image(width: 48.w, height: 48.w),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 42.h,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.title,
                              style: DLSTextStyle.labelMedium.copyWith(
                                color: DLSColors.textMain900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (widget.comingSoon)
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: Text(
                                'Coming Soon',
                                style: DLSTextStyle.labelLarge.copyWith(
                                  color: Color(0x801F2937),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Row(
                      spacing: 8.w,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: DLSColors.textMain900.withValues(
                                alpha: 0.1,
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.add_circle_outline_rounded,
                            size: 14.w,
                            color: DLSColors.textMain900,
                          ),
                        ),
                        Text(
                          isExpanded ? 'Hide Details' : 'See Details',
                          style: CustomTextStyles.geistMonoMedium10.copyWith(
                            color: DLSColors.textMain900.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!widget.comingSoon)
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 42.h,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '210',
                          style: DLSTextStyle.titleH2.copyWith(
                            color: DLSColors.textMain900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: ImpactCounter(value: '+54'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      content: Container(
        margin: EdgeInsets.all(8.w),
        padding: EdgeInsets.fromLTRB(8.w, 16.w, 8.w, 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: Column(
          spacing: 4.h,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      spacing: 4.h,
                      children: [
                        Text(
                          'Avg. Likes',
                          style: CustomTextStyles.geistMonoMedium10.copyWith(
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          '465',
                          style: CustomTextStyles.neueMontrealMedium12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImpactCounter(
                              size: ImpactCounterSize.small,
                              type: ImpactCounterType.negative,
                              value: '-2.4%',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 4.h,
                      children: [
                        Text(
                          'Avg. Replies',
                          style: CustomTextStyles.geistMonoMedium10.copyWith(
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          '465',
                          style: CustomTextStyles.neueMontrealMedium12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImpactCounter(
                              size: ImpactCounterSize.small,
                              type: ImpactCounterType.positive,
                              value: '+5.9%',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 4.h,
                      children: [
                        Text(
                          'Avg. Repost',
                          style: CustomTextStyles.geistMonoMedium10.copyWith(
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          '465',
                          style: CustomTextStyles.neueMontrealMedium12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImpactCounter(
                              size: ImpactCounterSize.small,
                              type: ImpactCounterType.negative,
                              value: '-1%',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Color(0x409A41F8),
              ),
              child: Row(
                spacing: 10.w,
                children: [
                  Assets.icons.trendUp.svg(
                    width: 14.w,
                    colorFilter: ColorFilter.mode(
                      Color(0xFF7246CE),
                      BlendMode.srcIn,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'This score measures how much the community interacts with your content through replies, likes, and reposts. It reflects the quality of the conversation you create.',
                      style: CustomTextStyles.neueMontrealRegular8.copyWith(
                        color: DLSColors.primaryBase,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
