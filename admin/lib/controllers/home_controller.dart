import 'package:get/get.dart';

class HomeController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
  }

  void decrement() {
    counter--;
  }

   void reset() {
    counter.value = 0;
  }
}
