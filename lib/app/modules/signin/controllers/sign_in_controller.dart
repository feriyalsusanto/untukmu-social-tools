import 'package:get/get.dart';

class SignInController extends GetxController {
  int currentIndex = 0;

  void switchContent(int index) {
    currentIndex = index;
    update();
  }
}
