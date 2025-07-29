import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CheckinBackgroundPainter extends CustomPainter {
  final double radius = 32;
  final ui.Image image;

  CheckinBackgroundPainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();

    // top-left
    path.moveTo(0, radius);
    path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius));

    // top-right 1
    path.lineTo(size.width * 0.6, 0);
    path.arcToPoint(
      Offset((size.width * 0.6) + (radius * 0.5), radius * 0.25),
      radius: Radius.circular(radius),
    );
    path.lineTo((size.width * 0.6) + (radius * 1.175), radius * 1.15);
    path.arcToPoint(
      Offset((size.width * 0.6) + (radius * 1.75), radius * 1.5),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width - radius, radius * 1.5);
    path.arcToPoint(
      Offset(size.width, radius * 2.5),
      radius: Radius.circular(radius),
    );

    // bottom-right
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: Radius.circular(radius),
    );

    // bottom-left
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: Radius.circular(radius),
    );

    path.close();

    Paint paint0Stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
    paint0Stroke.shader = ui.Gradient.linear(
      Offset(size.width * 0.00003560864, size.height * 7.995180e-7),
      Offset(size.width, size.height),
      [
        Color(0xffC56CFF),
        Color(0xff8426F5),
        Color(0xffA89EFF),
        Color(0xffC56CFF),
        Color(0xffA89EFF),
        Color(0xff8426F5),
        Color(0xffC56CFF),
      ],
      [0, 0.25, 0.4, 0.5, 0.6, 0.75, 1],
    );
    canvas.drawPath(path, paint0Stroke);

    canvas.clipPath(path);
    paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(0, 0, size.width, size.height),
      image: image,
      fit: BoxFit.cover,
      opacity: 0.5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
