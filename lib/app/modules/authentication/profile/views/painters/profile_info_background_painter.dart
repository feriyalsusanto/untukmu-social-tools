import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ProfileInfoBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.07272727, size.height * 0.005000000);
    path_0.lineTo(size.width * 0.1625445, size.height * 0.005000000);
    path_0.cubicTo(
      size.width * 0.1800323,
      size.height * 0.005001030,
      size.width * 0.1968959,
      size.height * 0.01931090,
      size.width * 0.2098545,
      size.height * 0.04514650,
    );
    path_0.lineTo(size.width * 0.2685991, size.height * 0.1622660);
    path_0.cubicTo(
      size.width * 0.2823936,
      size.height * 0.1897660,
      size.width * 0.3003432,
      size.height * 0.2049990,
      size.width * 0.3189586,
      size.height * 0.2050000,
    );
    path_0.lineTo(size.width * 0.9272727, size.height * 0.2050000);
    path_0.cubicTo(
      size.width * 0.9661818,
      size.height * 0.2050000,
      size.width * 0.9977273,
      size.height * 0.2743960,
      size.width * 0.9977273,
      size.height * 0.3600000,
    );
    path_0.lineTo(size.width * 0.9977273, size.height * 0.8400000);
    path_0.cubicTo(
      size.width * 0.9977273,
      size.height * 0.9256040,
      size.width * 0.9661818,
      size.height * 0.9950000,
      size.width * 0.9272727,
      size.height * 0.9950000,
    );
    path_0.lineTo(size.width * 0.3650568, size.height * 0.9950000);
    path_0.cubicTo(
      size.width * 0.3473782,
      size.height * 0.9949990,
      size.width * 0.3303445,
      size.height * 0.9803760,
      size.width * 0.3173386,
      size.height * 0.9540330,
    );
    path_0.lineTo(size.width * 0.2405982, size.height * 0.7986130);
    path_0.cubicTo(
      size.width * 0.2267527,
      size.height * 0.7705710,
      size.width * 0.2086232,
      size.height * 0.7550010,
      size.width * 0.1898036,
      size.height * 0.7550000,
    );
    path_0.lineTo(size.width * 0.07272727, size.height * 0.7550000);
    path_0.cubicTo(
      size.width * 0.03381632,
      size.height * 0.7550000,
      size.width * 0.002272727,
      size.height * 0.6856040,
      size.width * 0.002272727,
      size.height * 0.6000000,
    );
    path_0.lineTo(size.width * 0.002272727, size.height * 0.1600000);
    path_0.cubicTo(
      size.width * 0.002272727,
      size.height * 0.07439590,
      size.width * 0.03381632,
      size.height * 0.005000000,
      size.width * 0.07272727,
      size.height * 0.005000000,
    );
    path_0.close();

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
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xff201633);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
