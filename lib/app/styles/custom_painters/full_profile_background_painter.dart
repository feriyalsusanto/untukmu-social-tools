import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class FullProfileBackgroundPainter extends CustomPainter {
  final double radius;
  final ui.Image image;

  FullProfileBackgroundPainter({this.radius = 16, required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    // top-left
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    // top-right
    path.lineTo(size.width * 0.84 - radius, 0);

    path.arcToPoint(
      Offset(size.width * 0.845, radius * .5),
      radius: Radius.circular(radius * 2),
    );

    path.lineTo(size.width * 0.875, radius * 1.4);

    path.arcToPoint(
      Offset(size.width * 0.875 + radius * 1.15, radius * 1.8),
      radius: Radius.circular(radius * 1.75),
      clockwise: false,
    );

    path.lineTo(size.width - radius, radius * 1.8);

    path.arcToPoint(
      Offset(size.width, radius * 2.75),
      radius: Radius.circular(radius),
    );

    // bottom-right
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: Radius.circular(radius),
    );

    // // bottom-left
    path.lineTo(size.width * 0.225, size.height);

    path.arcToPoint(
      Offset((size.width * 0.2) - (radius * 0.5), size.height - (radius * .3)),
      radius: Radius.circular(radius * 1.75),
    );

    path.lineTo(size.width * 0.125, size.height - (radius * 1.75));

    path.arcToPoint(
      Offset(size.width * 0.125 - radius, size.height - (radius * 1.9)),
      radius: Radius.circular(radius * 1.75),
      clockwise: false,
    );

    path.lineTo(radius, size.height - (radius * 1.9));

    path.arcToPoint(
      Offset(0, size.height - (radius * 3)),
      radius: Radius.circular(radius * 1.5),
    );

    path.close();

    canvas.clipPath(path);
    paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(0, 0, size.width, size.height),
      image: image,
      fit: BoxFit.cover,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
