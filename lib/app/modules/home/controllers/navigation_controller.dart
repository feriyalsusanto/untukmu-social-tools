import 'package:get/get.dart';

class NavigationController extends GetxController {
  int currentIndex = 0;

  void changeIndex({required int activeIndex}) {
    currentIndex = activeIndex;
    update();
  }
}