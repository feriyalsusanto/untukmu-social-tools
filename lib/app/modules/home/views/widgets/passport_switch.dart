import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:untukmu_social_tools/gen/assets.gen.dart';

class PassportSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final String activeText;
  final String inactiveText;
  final SvgGenImage activeIcon;
  final SvgGenImage inactiveIcon;

  const PassportSwitch({
    super.key,
    required this.activeIcon,
    required this.inactiveIcon,
    this.initialValue = false,
    this.onChanged,
    this.activeText = 'Label 1',
    this.inactiveText = 'Label 2',
  });

  @override
  State<PassportSwitch> createState() => _PassportSwitchState();
}

class _PassportSwitchState extends State<PassportSwitch> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      _isActive = !_isActive;
    });
    widget.onChanged?.call(_isActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onChanged != null ? _toggle : null,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.25),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.fromLTRB(4, 4, 12, 4),
              decoration: BoxDecoration(
                color: _isActive ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                border:
                    _isActive
                        ? Border.all(
                          color: Colors.white.withValues(alpha: 0.25),
                          width: 1,
                        )
                        : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 14.r,
                    backgroundColor: DLSColors.bgStrong900.withValues(
                      alpha: 0.05,
                    ),
                    child: widget.activeIcon.svg(
                      colorFilter: ColorFilter.mode(
                        _isActive ? Colors.black : Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  if (_isActive) SizedBox(width: 8),
                  if (_isActive)
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: DLSTextStyle.labelMedium.copyWith(
                        color: Color(0xFF292D32),
                      ),
                      child: Text(widget.activeText),
                    ),
                ],
              ),
            ),
            SizedBox(width: _isActive ? 8.w : 0),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.fromLTRB(4, 4, 12, 4),
              decoration: BoxDecoration(
                color: !_isActive ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                border:
                    !_isActive
                        ? Border.all(
                          color: Colors.white.withValues(alpha: 0.25),
                          width: 1,
                        )
                        : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 14.r,
                    backgroundColor: DLSColors.bgStrong900.withValues(
                      alpha: 0.05,
                    ),
                    child: widget.inactiveIcon.svg(
                      colorFilter: ColorFilter.mode(
                        !_isActive ? Color(0xFF292D32) : Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  if (!_isActive) SizedBox(width: !_isActive ? 8.w : 0),
                  if (!_isActive)
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: DLSTextStyle.labelMedium.copyWith(
                        color: !_isActive ? Color(0xFF292D32) : Colors.white,
                      ),
                      child: Text(widget.inactiveText),
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
