import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

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
    return Container(
      margin: EdgeInsets.all(DLSSizing.xSmall),
      padding: EdgeInsets.all(DLSSizing.s3xSmall),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(DLSSizing.radius32),
      ),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top content
          Container(
            padding: EdgeInsets.all(DLSSizing.medium),
            child: topContent,
          ),
          if (bottomContent != null)
            // Bottom content
            Container(
              padding: EdgeInsets.only(
                left: DLSSizing.s2xSmall,
                right: DLSSizing.s2xSmall,
              ),
              child: bottomContent,
            ),
        ],
      ),
    );
  }
}
