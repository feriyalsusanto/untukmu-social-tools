import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static final ProfileController instance = Get.find();

  bool isLoading = false;

  ui.Image? uiProfileImage;

  Future<void> setup() async {
    isLoading = true;
    update();

    const keyName = 'assets/images/default_profile_picture.png';
    final data = (await rootBundle.load(keyName));
    final bytes = data.buffer.asUint8List();
    uiProfileImage = await decodeImageFromList(bytes);

    isLoading = false;
    update();
  }
}
