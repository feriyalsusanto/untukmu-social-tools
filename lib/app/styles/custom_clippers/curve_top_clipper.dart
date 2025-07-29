import 'package:flutter/material.dart';

class CurveTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start at top-left
    path.moveTo(0, 0);

    // Line to bottom-left
    path.lineTo(0, size.height);

    // Line to bottom-right
    path.lineTo(size.width, size.height);

    // Circular arc back to top-left
    path.arcToPoint(
      Offset(0, 0), // Back to top-left
      radius: Radius.circular(size.width * 0.85),
      clockwise: true,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}