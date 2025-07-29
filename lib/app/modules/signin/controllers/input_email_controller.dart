import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum InputEmailState { email, name }

class InputEmailController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  InputEmailState state = InputEmailState.email;

  void changeState(InputEmailState state) {
    this.state = state;
    update();
  }
}
