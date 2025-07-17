import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ProfileImageBackground extends CustomPainter {
  final ui.Image image;
  ProfileImageBackground({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8460500, size.height * 0.07271591);
    path_0.cubicTo(
      size.width * 0.8593364,
      size.height * 0.08443955,
      size.width * 0.8764455,
      size.height * 0.09090909,
      size.width * 0.8941682,
      size.height * 0.09090909,
    );
    path_0.lineTo(size.width * 0.9272727, size.height * 0.09090909);
    path_0.cubicTo(
      size.width * 0.9674409,
      size.height * 0.09090909,
      size.width,
      size.height * 0.1234700,
      size.width,
      size.height * 0.1636364,
    );
    path_0.lineTo(size.width, size.height * 0.9272727);
    path_0.cubicTo(
      size.width,
      size.height * 0.9674409,
      size.width * 0.9674409,
      size.height,
      size.width * 0.9272727,
      size.height,
    );
    path_0.lineTo(size.width * 0.3274982, size.height);
    path_0.cubicTo(
      size.width * 0.3097782,
      size.height,
      size.width * 0.2926677,
      size.height * 0.9935318,
      size.width * 0.2793805,
      size.height * 0.9818045,
    );
    path_0.lineTo(size.width * 0.2175877, size.height * 0.9272864);
    path_0.cubicTo(
      size.width * 0.2043005,
      size.height * 0.9155591,
      size.width * 0.1871900,
      size.height * 0.9090909,
      size.width * 0.1694700,
      size.height * 0.9090909,
    );
    path_0.lineTo(size.width * 0.07272727, size.height * 0.9090909);
    path_0.cubicTo(
      size.width * 0.03256109,
      size.height * 0.9090909,
      0,
      size.height * 0.8765318,
      0,
      size.height * 0.8363636,
    );
    path_0.lineTo(0, size.height * 0.07272727);
    path_0.cubicTo(
      0,
      size.height * 0.03256109,
      size.width * 0.03256109,
      0,
      size.width * 0.07272727,
      0,
    );
    path_0.lineTo(size.width * 0.7361364, 0);
    path_0.cubicTo(
      size.width * 0.7538591,
      0,
      size.width * 0.7709682,
      size.height * 0.006469455,
      size.width * 0.7842545,
      size.height * 0.01819327,
    );
    path_0.lineTo(size.width * 0.8460500, size.height * 0.07271591);
    path_0.close();

    canvas.clipPath(path_0);
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
