import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key, required this.onSwipeUp});

  final Function() onSwipeUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: (details) {
        if (details.velocity.pixelsPerSecond.dy < -500) {
          onSwipeUp();
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.bgSignIn.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Where Data Meets Identity',
                          style: DLSTextStyle.display1.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Every click, badge, and signal tells a story.',
                          style: DLSTextStyle.labelLarge.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Your Profile Passport turns reputation into opportunity.',
                          style: DLSTextStyle.labelLarge.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedScrollToContinue(),
          ],
        ),
      ),
    );
  }
}

class AnimatedScrollToContinue extends StatefulWidget {
  const AnimatedScrollToContinue({super.key});

  @override
  State<AnimatedScrollToContinue> createState() =>
      _AnimatedScrollToContinueState();
}

class _AnimatedScrollToContinueState extends State<AnimatedScrollToContinue>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Slide animation from top to bottom
    _slideAnimation = Tween<double>(begin: -20.0, end: 20.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Fade animation for smooth appearance/disappearance
    _fadeAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Start the animation and repeat
    _startAnimation();
  }

  void _startAnimation() {
    _animationController.forward().then((_) {
      _animationController.reverse().then((_) {
        if (mounted) {
          _startAnimation();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4.w,
                children: [
                  Text(
                    'Scroll to Continue',
                    style: DLSTextStyle.titleH4.copyWith(color: Colors.white),
                  ),
                  Icon(
                    FontAwesomeIcons.anglesDown,
                    color: Colors.white,
                    size: 14.w,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
