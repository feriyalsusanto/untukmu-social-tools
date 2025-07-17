import 'package:get/get.dart';

enum WaitlistState { joining, joined }

class WaitlistController extends GetxController {
  static final WaitlistController instance = Get.find();

  WaitlistState state = WaitlistState.joining;

  void setState({required WaitlistState state}) {
    this.state = state;
    update();
  }
}
