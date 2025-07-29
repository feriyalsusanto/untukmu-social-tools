import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomSwitch extends StatefulWidget {
  final Function(int)? onChanged;
  final int initialIndex;
  final List<String> options;

  const CustomSwitch({
    super.key,
    this.onChanged,
    this.initialIndex = 0,
    this.options = const ['All', 'X', 'Wallet'],
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: _selectedIndex.toDouble(),
      end: _selectedIndex.toDouble(),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      _animation = Tween<double>(
        begin: _animation.value,
        end: index.toDouble(),
      ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
      );

      _animationController.forward(from: 0);
      widget.onChanged?.call(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Color(0xFFF1F5F8),
        borderRadius: DLSRadius.radiusFull,
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              // Animated background indicator
              Positioned.fill(
                child: Row(
                  children: List.generate(
                    widget.options.length,
                    (index) => Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: index == 0 ? 0 : 2.w,
                          right: index == widget.options.length - 1 ? 0 : 2.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: DLSRadius.radiusFull,
                          color: _getBackgroundColor(index),
                          boxShadow: _getBoxShadow(index),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Text options
              Row(
                children: List.generate(
                  widget.options.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () => _onTap(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.h,
                          horizontal: 8.w,
                        ),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: DLSTextStyle.labelLarge.copyWith(
                            color: _getTextColor(index),
                          ),
                          child: Text(
                            widget.options[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Color _getBackgroundColor(int index) {
    double animationValue = _animation.value;
    double distance = (index - animationValue).abs();

    if (distance < 0.5) {
      return Colors.white;
    } else {
      return Colors.transparent;
    }
  }

  List<BoxShadow> _getBoxShadow(int index) {
    double animationValue = _animation.value;
    double distance = (index - animationValue).abs();

    if (distance < 0.5) {
      return [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          offset: Offset(0, 4),
          blurRadius: 4,
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          offset: Offset(0, 2),
          blurRadius: 2,
        ),
      ];
    } else {
      return [];
    }
  }

  Color _getTextColor(int index) {
    return Color(0xFF1D2729).withValues(alpha: 0.5);
  }
}
