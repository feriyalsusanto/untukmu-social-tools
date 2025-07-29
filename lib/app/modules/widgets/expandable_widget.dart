import 'package:flutter/material.dart';

/// A customizable expandable widget with smooth animations
class ExpandableWidget extends StatefulWidget {
  /// The header widget that's always visible
  final Widget header;

  /// The content widget that expands/collapses
  final Widget content;

  /// Initial expanded state
  final bool initiallyExpanded;

  /// Duration of the expansion animation
  final Duration duration;

  /// Animation curve for expansion
  final Curve curve;

  /// Optional callback when expansion state changes
  final ValueChanged<bool>? onExpansionChanged;

  /// Whether to show a trailing icon (chevron)
  final bool showTrailingIcon;

  /// Custom trailing icon
  final Widget? trailingIcon;

  /// Icon color
  final Color? iconColor;

  /// Whether the header is clickable to toggle expansion
  final bool headerClickable;

  /// Custom padding for the content
  final EdgeInsetsGeometry? contentPadding;

  /// Custom decoration for the entire widget
  final BoxDecoration? decoration;

  /// Custom decoration for the header
  final BoxDecoration? headerDecoration;

  /// Custom decoration for the content
  final BoxDecoration? contentDecoration;

  /// Background color for the entire widget
  final Color? backgroundColor;

  /// Background color for the header section
  final Color? headerBackgroundColor;

  /// Background color for the content section
  final Color? contentBackgroundColor;

  /// Background gradient for the entire widget
  final Gradient? backgroundGradient;

  /// Background gradient for the header section
  final Gradient? headerBackgroundGradient;

  /// Background gradient for the content section
  final Gradient? contentBackgroundGradient;

  const ExpandableWidget({
    super.key,
    required this.header,
    required this.content,
    this.initiallyExpanded = false,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.onExpansionChanged,
    this.showTrailingIcon = true,
    this.trailingIcon,
    this.iconColor,
    this.headerClickable = true,
    this.contentPadding,
    this.decoration,
    this.headerDecoration,
    this.contentDecoration,
    this.backgroundColor,
    this.headerBackgroundColor,
    this.contentBackgroundColor,
    this.backgroundGradient,
    this.headerBackgroundGradient,
    this.contentBackgroundGradient,
  });

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  late Animation<double> _iconRotation;
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;

    _controller = AnimationController(duration: widget.duration, vsync: this);

    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _iconRotation = Tween<double>(
      begin: 0.0,
      end: 0.5, // 180 degrees
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    widget.onExpansionChanged?.call(_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          widget.decoration ??
          BoxDecoration(
            color: widget.backgroundColor,
            gradient: widget.backgroundGradient,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          GestureDetector(
            onTap: widget.headerClickable ? _toggleExpansion : null,
            child: Container(
              decoration:
                  widget.headerDecoration ??
                  BoxDecoration(
                    color: widget.headerBackgroundColor,
                    gradient: widget.headerBackgroundGradient,
                  ),
              child: Row(
                children: [
                  Expanded(child: widget.header),
                  if (widget.showTrailingIcon)
                    AnimatedBuilder(
                      animation: _iconRotation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _iconRotation.value * 3.14159,
                          child:
                              widget.trailingIcon ??
                              Icon(
                                Icons.keyboard_arrow_down,
                                color:
                                    widget.iconColor ??
                                    Theme.of(context).iconTheme.color,
                              ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),

          // Expandable Content
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: Container(
              width: double.infinity,
              padding: widget.contentPadding,
              decoration:
                  widget.contentDecoration ??
                  BoxDecoration(
                    color: widget.contentBackgroundColor,
                    gradient: widget.contentBackgroundGradient,
                  ),
              child: widget.content,
            ),
          ),
        ],
      ),
    );
  }
}

/// A simple expandable card widget
class ExpandableCard extends StatelessWidget {
  final String title;
  final Widget content;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? headerColor;
  final TextStyle? titleStyle;

  const ExpandableCard({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
    this.padding,
    this.backgroundColor,
    this.headerColor,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: ExpandableWidget(
        initiallyExpanded: initiallyExpanded,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        header: Container(
          padding: padding ?? const EdgeInsets.all(16),
          color: headerColor,
          child: Text(
            title,
            style:
                titleStyle ??
                Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        content: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: content,
        ),
      ),
    );
  }
}

/// Example usage and demo
class ExpandableWidgetDemo extends StatelessWidget {
  const ExpandableWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expandable Widget Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Expandable Widget
            ExpandableWidget(
              header: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Basic Expandable Widget',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              content: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'This is the expandable content. You can put any widget here. '
                  'The expansion animation is smooth and customizable.',
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(height: 16),

            // Background Color Examples
            ExpandableWidget(
              backgroundColor: Colors.orange.shade50,
              headerBackgroundColor: Colors.orange.shade100,
              contentBackgroundColor: Colors.orange.shade200,
              header: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Background Colors Example',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              content: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'This widget demonstrates individual background colors for the widget, header, and content sections.',
                ),
              ),
              iconColor: Colors.orange,
            ),

            const SizedBox(height: 16),

            // Gradient Background Example
            ExpandableWidget(
              backgroundGradient: LinearGradient(
                colors: [Colors.purple.shade100, Colors.blue.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              headerBackgroundGradient: LinearGradient(
                colors: [Colors.purple.shade200, Colors.blue.shade200],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              contentBackgroundGradient: LinearGradient(
                colors: [Colors.purple.shade50, Colors.blue.shade50],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              header: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Gradient Backgrounds Example',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              content: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'This widget showcases gradient backgrounds for different sections. '
                  'You can apply gradients to the entire widget, header, or content individually.',
                ),
              ),
              iconColor: Colors.purple,
            ),

            const SizedBox(height: 16),

            // Styled Expandable Widget
            ExpandableWidget(
              initiallyExpanded: true,
              header: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue.shade50,
                child: const Text(
                  'Styled Expandable Widget',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              content: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Features:'),
                    const SizedBox(height: 8),
                    _buildFeatureItem('Smooth animations'),
                    _buildFeatureItem('Customizable styling'),
                    _buildFeatureItem('Callback support'),
                    _buildFeatureItem('Flexible content'),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              iconColor: Colors.blue,
            ),

            const SizedBox(height: 16),

            // Expandable Card (simplified version)
            ExpandableCard(
              title: 'Expandable Card',
              backgroundColor: Colors.green.shade50,
              headerColor: Colors.green.shade100,
              titleStyle: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('This is a simplified expandable card widget.'),
                  SizedBox(height: 8),
                  Text(
                    'Perfect for FAQ sections, settings, or any collapsible content.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Custom Icon Expandable Widget
            ExpandableWidget(
              header: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Custom Icon Widget',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              content: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'This expandable widget uses a custom plus/minus icon instead of the default chevron.',
                ),
              ),
              trailingIcon: const Icon(Icons.add),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              iconColor: Colors.purple,
              onExpansionChanged: (isExpanded) {
                print('Widget expanded: $isExpanded');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, size: 16, color: Colors.green),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
