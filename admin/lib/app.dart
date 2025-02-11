// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtms_application/screens/pages/login-page.dart';
import 'constants.dart';
import 'routes/app_pages.dart';
import 'screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    bool isLoggedIn = storage.read('isLoggedIn') ?? false;

    return GetMaterialApp(
      title: 'WTMS Application',
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: isLoggedIn ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
      navigatorKey: Get.key,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: const Color(0xFFB5230C),
      ),
    );
  }
}
