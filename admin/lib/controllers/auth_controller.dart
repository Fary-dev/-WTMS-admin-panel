import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtms_application/constants.dart';
import 'package:wtms_application/screens/home_page.dart';
import '../widgets/custom_extension.dart';

class AuthController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isLoggedIn = false.obs;
  var isLoading = false.obs;

  void login() async {
    // if (username.value.isEmpty || password.value.isEmpty) {
    //   Get.context?.showCustomSnackbar('Bitte alle Felder ausfüllen!',
    //       bgColor: errorBackground, textColor: Colors.white);

    //   return;
    // }

    // isLoading.value = true;

    // await Future.delayed(const Duration(seconds: 2));

    // if (username.value == 'user' && password.value == 'password') {
    // isLoggedIn.value = true;
    // isLoading.value = false;
    Get.offAll(() => const HomePage());
    // } else {
    //   isLoading.value = false;
    //   Get.context?.showCustomSnackbar('Ungültige Anmeldedaten',
    //       bgColor: errorBackground, textColor: Colors.white);
    // }
  }
}
