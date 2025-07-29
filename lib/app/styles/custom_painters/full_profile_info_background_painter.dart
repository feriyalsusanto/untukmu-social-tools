import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class FullProfileInfoBackgroundPainter extends CustomPainter {
  final double radius;
  final Color? color;

  FullProfileInfoBackgroundPainter({this.radius = 16, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    // top-left
    path.moveTo(0, radius);
    path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius));

    // top-right 1
    path.lineTo(size.width * .1, 0);
    path.arcToPoint(
      Offset(size.width * .1 + radius, radius * 0.5),
      radius: Radius.circular(radius * 1.5),
    );

    path.lineTo((size.width * .1) + (radius * 2), radius * 1.5);

    path.arcToPoint(
      Offset((size.width * .1) + (radius * 3), radius * 1.75),
      radius: Radius.circular(radius * 1.5),
      clockwise: false,
    );

    path.lineTo(size.width - radius, radius * 1.75);

    path.arcToPoint(
      Offset(size.width, radius * 3),
      radius: Radius.circular(radius * 1.25),
    );

    path.lineTo(size.width, size.height - radius);

    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: Radius.circular(radius),
    );

    path.lineTo(size.width * .6, size.height);

    path.arcToPoint(
      Offset(size.width * .6 - radius, size.height - radius * 0.5),
      radius: Radius.circular(radius * 1.5),
    );

    path.lineTo(size.width * .6 - radius * 1.75, size.height - radius * 1.5);

    path.arcToPoint(
      Offset(size.width * .6 - radius * 3, size.height - radius * 2),
      radius: Radius.circular(radius * 1.5),
      clockwise: false,
    );

    path.lineTo(radius, size.height - radius * 2);

    path.arcToPoint(
      Offset(0, size.height - radius * 3),
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

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color ?? Colors.white;
    canvas.drawPath(path, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
