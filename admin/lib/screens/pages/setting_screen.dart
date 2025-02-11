import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  // Zustände
  final RxBool _notificationsEnabled = true.obs;
  final RxBool _darkModeEnabled = false.obs;
  final RxString _selectedLanguage = 'English'.obs;

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Benachrichtigungseinstellungen
          Obx(() => SwitchListTile(
                title: const Text('Enable Notifications'),
                value: _notificationsEnabled.value,
                onChanged: (bool value) {
                  _notificationsEnabled.value = value;
                },
              )),
          const Divider(),

          // Dunkelmodus-Einstellung
          Obx(() => SwitchListTile(
                title: const Text('Enable Dark Mode'),
                value: _darkModeEnabled.value,
                onChanged: (bool value) {
                  _darkModeEnabled.value = value;
                },
              )),
          const Divider(),

          // Spracheinstellung
          ListTile(
            title: const Text('Language'),
            subtitle: Obx(() => Text(_selectedLanguage.value)),
            onTap: () async {
              // Sprachwahl-Dialog
              String? newLanguage = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Choose Language'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('English'),
                          onTap: () {
                            Navigator.pop(context, 'English');
                          },
                        ),
                        ListTile(
                          title: const Text('Deutsch'),
                          onTap: () {
                            Navigator.pop(context, 'Deutsch');
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
              // Wenn eine Sprache ausgewählt wurde
              if (newLanguage != null) {
                _selectedLanguage.value = newLanguage;
              }
            },
          ),
          const Divider(),

          // Account-Einstellungen
          ListTile(
            title: const Text('Account Settings'),
            onTap: () {
              // Hier kann man die Logik für das Anzeigen von Account-Einstellungen hinzufügen
              print('Navigate to Account Settings');
            },
          ),
          const Divider(),

          // Datenschutzeinstellungen
          ListTile(
            title: const Text('Privacy Settings'),
            onTap: () {
              // Hier kann man die Logik für die Datenschutzeinstellungen hinzufügen
              print('Navigate to Privacy Settings');
            },
          ),
          const Divider(),

          // Abmelden
          ListTile(
            title: const Text('Logout'),
            textColor: Colors.red,
            onTap: () {
              // Abmelde-Logik hier
              print('Logout');
            },
          ),
        ],
      ),
    );
  }
}
