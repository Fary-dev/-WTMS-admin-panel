import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtms_application/screens/pages/dashboard_screen.dart';
import 'package:wtms_application/screens/pages/login-page.dart';
import 'package:wtms_application/screens/pages/products_screen.dart';
import 'package:wtms_application/screens/pages/profile_screen.dart';
import 'package:wtms_application/screens/pages/setting_screen.dart';
import 'package:wtms_application/screens/pages/users_screen.dart';
import 'package:wtms_application/screens/pages/orders_screen.dart';

import '../../routes/app_pages.dart';

// GetX Controller für die Navigation
class NavigationController extends GetxController {
  // Rx-Variable, die den aktuellen Bildschirm steuert
  var currentScreen = 'dashboard'.obs;
}

class WebDesktopLayout extends StatelessWidget {
  const WebDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Holen des NavigationControllers
    final NavigationController navController = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('WEB Admin Panel'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          // Sidebar Widget
          Widget sidebar = NavigationDrawer(
            onItemSelected: (String route) {
              // Aktualisieren der aktuellen Route, ohne die Seite neu zu laden
              navController.currentScreen.value = route;
            },
          );

          // Wenn es ein Mobile-Layout ist, zeigen wir die Sidebar als Drawer
          if (isMobile) {
            sidebar = Drawer(
              child: NavigationDrawer(
                onItemSelected: (String route) {
                  // Aktualisieren der aktuellen Route, ohne die Seite neu zu laden
                  navController.currentScreen.value = route;
                },
              ),
            );
          }

          return Row(
            children: [
              // Sidebar
              if (!isMobile) ...[
                Expanded(flex: 1, child: sidebar),
              ],

              // Hauptinhalt (abhängig vom aktuellen Wert von currentScreen)
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Obx(() {
                    // Dynamische Anzeige des aktuellen Screens basierend auf currentScreen
                    switch (navController.currentScreen.value) {
                      case 'dashboard':
                        return const DashboardScreen();
                      case 'users':
                        return UsersScreen();
                      case 'products':
                        return ProductScreen();
                      case 'setting':
                        return SettingsScreen();
                      case 'orders':
                        return const OrdersScreen();
                      case 'profile':
                        return const ProfileScreen();
                      default:
                        return const DashboardScreen(); // Default screen
                    }
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Sidebar Widget
class NavigationDrawer extends StatelessWidget {
  final void Function(String route) onItemSelected;

  const NavigationDrawer({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[800],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Text(
              'Admin Panel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () {
              // Setze den aktuellen Bildschirm auf "dashboard"
              onItemSelected('dashboard');
            },
          ),
          ListTile(
            title: const Text('Benutzerverwaltung'),
            onTap: () {
              // Setze den aktuellen Bildschirm auf "users"
              onItemSelected('users');
            },
          ),
          ListTile(
            title: const Text('Dienstleistungen'),
            onTap: () {
              // Setze den aktuellen Bildschirm auf "users"
              onItemSelected('products');
            },
          ),
          ListTile(
            title: const Text('Einstellungen'),
            onTap: () {
              // Setze den aktuellen Bildschirm auf "settings"
              onItemSelected('settings');
            },
          ),
          ListTile(
            title: const Text('Bestellungen'),
            onTap: () {
              // Setze den aktuellen Bildschirm auf "orders"
              onItemSelected('orders');
            },
          ),
          ListTile(
            title: const Text('Profil'),
            onTap: () {
              // Setze den aktuellen Bildschirm auf "profile"
              onItemSelected('profile');
            },
          ),
          ListTile(
            title: const Text('Abmelden'),
            onTap: () {
              // Abmelde-Logik hier
              Get.offAll(() => const LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
