import 'package:flutter/material.dart';

class TextGradient extends StatelessWidget {
  const TextGradient(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback:
          (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      child: Text(text, style: style, textAlign: textAlign),
    );
  }
}
