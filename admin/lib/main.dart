import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtms_application/app.dart';
import 'package:wtms_application/screens/pages/login-page.dart';
import 'constants.dart';
import 'routes/app_pages.dart';
import 'screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp( const MyApp());
}
