import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum IconPosition { left, right }

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    this.assetName,
    this.labelIcon,
    required this.label,
    required this.onPressed,
    this.darkMode = false,
    this.iconPosition = IconPosition.left,
  });

  final String? assetName;
  final IconData? labelIcon;
  final String label;
  final VoidCallback onPressed;
  final bool darkMode;
  final IconPosition iconPosition;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: darkMode ? DLSColors.bgStrong900 : DLSColors.bgWhite0,
        foregroundColor: darkMode ? DLSColors.bgWhite0 : DLSColors.bgStrong900,
        elevation: 0,
        padding: EdgeInsets.all(DLSSizing.s3xSmall),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DLSSizing.radius16),
          side:
              !darkMode
                  ? BorderSide(color: DLSColors.strokeSub300, width: 1)
                  : BorderSide.none,
        ),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        spacing: 12,
        children: [
          Visibility(
            visible: assetName != null && iconPosition == IconPosition.left,
            replacement: SizedBox(
              width: 26 + (DLSSizing.s4xSmall * 2),
              height: 26 + (DLSSizing.s4xSmall * 2),
            ),
            child: Container(
              padding: EdgeInsets.all(DLSSizing.s4xSmall),
              decoration: BoxDecoration(
                color: DLSColors.bgWeak100.withValues(
                  alpha: darkMode ? 0.1 : 1.0,
                ),
                borderRadius: BorderRadius.circular(DLSSizing.radius8),
              ),
              child: SvgPicture.asset(
                assetName ?? '',
                width: 26,
                height: 26,
                colorFilter:
                    darkMode
                        ? ColorFilter.mode(DLSColors.bgWhite0, BlendMode.srcIn)
                        : null,
              ),
            ),
          ),
          Expanded(
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (labelIcon != null)
                  Icon(
                    labelIcon,
                    size: DLSTextStyle.labelLarge.fontSize,
                    color:
                        darkMode ? DLSColors.bgWhite0 : DLSColors.bgStrong900,
                  ),
                Text(
                  label,
                  style: DLSTextStyle.labelLarge.copyWith(
                    color:
                        darkMode ? DLSColors.textWhite0 : DLSColors.textMain900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Visibility(
            visible: assetName != null && iconPosition == IconPosition.right,
            replacement: SizedBox(
              width: 26 + (DLSSizing.s4xSmall * 2),
              height: 26 + (DLSSizing.s4xSmall * 2),
            ),
            child: Container(
              padding: EdgeInsets.all(DLSSizing.s4xSmall),
              decoration: BoxDecoration(
                color: DLSColors.bgWeak100.withValues(
                  alpha: darkMode ? 0.1 : 1.0,
                ),
                borderRadius: BorderRadius.circular(DLSSizing.radius8),
              ),
              child: SvgPicture.asset(
                assetName ?? '',
                width: 26,
                height: 26,
                colorFilter:
                    darkMode
                        ? ColorFilter.mode(DLSColors.bgWhite0, BlendMode.srcIn)
                        : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
