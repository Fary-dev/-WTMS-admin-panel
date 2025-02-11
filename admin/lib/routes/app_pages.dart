import 'package:get/get.dart';
import 'package:wtms_application/app.dart';
import 'package:wtms_application/main.dart';
import 'package:wtms_application/screens/home_page.dart';
import 'package:wtms_application/screens/pages/login-page.dart';
import 'package:wtms_application/screens/pages/orders_screen.dart';
import 'package:wtms_application/screens/pages/products_screen.dart';

import '../screens/pages/dashboard_screen.dart';
import '../screens/pages/profile_screen.dart';
import '../screens/pages/setting_screen.dart';
import '../screens/pages/users_screen.dart';
part 'app_routes.dart'; // Dies importiert die Routen, die wir später definieren

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: Routes.USERS,
      page: () => UsersScreen(),
    ),
    GetPage(
      name: Routes.USERS,
      page: () => ProductScreen(),
    ),
    GetPage(
      name: Routes.USERS,
      page: () => UsersScreen(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.ORDERS,
      page: () => const OrdersScreen(),
    ),
  ];
}
