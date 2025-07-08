import 'package:get/get.dart';

class CountController extends GetxController {
  var count = 0.obs;

  void inc() {
    count++;
    update();
  }

  void dec() {
    count--;
    update();
  }
}