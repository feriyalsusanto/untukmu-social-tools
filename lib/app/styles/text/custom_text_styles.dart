import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomTextStyles {
  static const _neueMontrealFamily = 'NeueMontreal';
  static const _geistMonoFamily = 'GeistMono';
  static const _lufgaFamily = 'Lufga';

  static const TextStyle lufgaRegular10 = TextStyle(
    fontFamily: _lufgaFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 16 / 10,
  );

  static const TextStyle lufgaRegular12 = TextStyle(
    fontFamily: _lufgaFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1,
  );

  static const TextStyle neueMontrealRegular8 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w400,
    fontSize: 8,
    height: 10 / 8,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealMedium10 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w500,
    fontSize: 10,
    height: 12 / 10,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealMedium12 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealMedium14 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealMedium16 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealMedium20 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 22 / 20,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealRegular10 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 1,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealRegular12 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealRegular16 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealRegular20 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 1,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealRegular24 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 1,
    letterSpacing: 0.4,
  );

  static const TextStyle neueMontrealRegular32 = TextStyle(
    fontFamily: _neueMontrealFamily,
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 1,
    letterSpacing: 0.4,
  );

  static const TextStyle geistMonoMedium10 = TextStyle(
    fontFamily: _geistMonoFamily,
    fontWeight: FontWeight.w500,
    fontSize: 10,
    height: 12 / 10,
    letterSpacing: 0.4,
  );

  static const TextStyle geistMonoMedium12 = TextStyle(
    fontFamily: _geistMonoFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.4,
  );

  static TextStyle interMedium32 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 32.sp,
    letterSpacing: -32 * 0.0506,
    color: DLSColors.textMain900,
  );

  static TextStyle bricolageMedium24 = GoogleFonts.bricolageGrotesque(
    fontWeight: FontWeight.w500,
    fontSize: 24.sp,
    height: 1,
    letterSpacing: 24 * -0.015,
    color: DLSColors.textMain900,
  );
}
