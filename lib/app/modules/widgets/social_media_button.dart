import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum IconPosition { left, right, clip }

enum ButtonRadius { normal, full }

enum ButtonType { normal, outline }

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    this.assetName,
    this.labelIcon,
    required this.label,
    required this.onPressed,
    this.darkMode = false,
    this.iconPosition = IconPosition.left,
    this.buttonRadius = ButtonRadius.normal,
    this.showIconBackground = true,
    this.backgroundColor,
    this.foregroundColor,
    this.iconBackgroundColor,
    this.borderColor,
    this.buttonType = ButtonType.normal,
  });

  final String? assetName;
  final IconData? labelIcon;
  final String label;
  final VoidCallback onPressed;
  final bool darkMode;
  final IconPosition iconPosition;
  final ButtonRadius buttonRadius;
  final bool showIconBackground;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? iconBackgroundColor;
  final Color? borderColor;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    final color =
        backgroundColor ??
        (darkMode ? DLSColors.bgStrong900 : DLSColors.bgWhite0);
    final fColor =
        foregroundColor ??
        (darkMode ? DLSColors.bgWhite0 : DLSColors.bgStrong900);
    bool isClip = iconPosition == IconPosition.clip;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            buttonType == ButtonType.normal ? color : Colors.transparent,
        foregroundColor: fColor,
        elevation: 0,
        padding: EdgeInsets.all(DLSSizing.s3xSmall),
        shape: RoundedRectangleBorder(
          borderRadius:
              buttonRadius == ButtonRadius.full
                  ? BorderRadius.circular(DLSSizing.radiusFull)
                  : BorderRadius.circular(DLSSizing.radius16),
          side:
              buttonType == ButtonType.normal
                  ? !darkMode
                      ? BorderSide(color: DLSColors.strokeSub300, width: 1)
                      : BorderSide.none
                  : BorderSide(
                    color: borderColor ?? DLSColors.strokeSub300,
                    width: 1,
                  ),
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
              width: isClip ? 0 : 26 + (DLSSizing.s4xSmall * 2),
              height: isClip ? 0 : 26 + (DLSSizing.s4xSmall * 2),
            ),
            child: Container(
              padding: EdgeInsets.all(DLSSizing.s4xSmall),
              decoration:
                  showIconBackground
                      ? BoxDecoration(
                        color:
                            iconBackgroundColor ??
                            DLSColors.bgWeak100.withValues(
                              alpha: darkMode ? 0.1 : 1.0,
                            ),
                        borderRadius: BorderRadius.circular(DLSSizing.radius8),
                      )
                      : null,
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
                    color: fColor,
                  ),
                if (isClip)
                  Container(
                    padding: EdgeInsets.all(DLSSizing.s4xSmall),
                    decoration:
                        showIconBackground
                            ? BoxDecoration(
                              color:
                                  iconBackgroundColor ??
                                  DLSColors.bgWeak100.withValues(
                                    alpha: darkMode ? 0.1 : 1.0,
                                  ),
                              borderRadius: BorderRadius.circular(
                                DLSSizing.radius8,
                              ),
                            )
                            : null,
                    child: SvgPicture.asset(
                      assetName ?? '',
                      width: 26,
                      height: 26,
                      colorFilter:
                          darkMode
                              ? ColorFilter.mode(
                                DLSColors.bgWhite0,
                                BlendMode.srcIn,
                              )
                              : null,
                    ),
                  ),
                Text(
                  label,
                  style: DLSTextStyle.labelLarge.copyWith(color: fColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Visibility(
            visible: assetName != null && iconPosition == IconPosition.right,
            replacement: SizedBox(
              width: isClip ? 0 : 26 + (DLSSizing.s4xSmall * 2),
              height: isClip ? 0 : 26 + (DLSSizing.s4xSmall * 2),
            ),
            child: Container(
              padding: EdgeInsets.all(DLSSizing.s4xSmall),
              decoration:
                  showIconBackground
                      ? BoxDecoration(
                        color:
                            iconBackgroundColor ??
                            DLSColors.bgWeak100.withValues(
                              alpha: darkMode ? 0.1 : 1.0,
                            ),
                        borderRadius: BorderRadius.circular(DLSSizing.radius8),
                      )
                      : null,
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
