import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/app/modules/signin/views/widgets/widgets.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({
    super.key,
    required this.topContent,
    this.bottomContent,
  });

  final Widget topContent;
  final Widget? bottomContent;

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      margin: EdgeInsets.all(DLSSizing.xSmall),
      padding: EdgeInsets.all(DLSSizing.s2xSmall),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top content
          Container(
            padding: EdgeInsets.all(DLSSizing.medium),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DLSSizing.radius32),
            ),
            child: topContent,
          ),
          if (bottomContent != null)
            // Bottom content
            Container(
              padding: EdgeInsets.all(DLSSizing.s2xSmall),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DLSSizing.radius32),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.25),
                  width: 1,
                ),
                boxShadow: [DLSShadow.xLargeShadow],
              ),
              child: bottomContent,
            ),
        ],
      ),
    );
  }
}
