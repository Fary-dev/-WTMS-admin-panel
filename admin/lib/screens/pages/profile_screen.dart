import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Hier kannst du die Bearbeitungsseite aufrufen oder Popup-Dialoge anzeigen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profilbild
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: const NetworkImage(
                    'https://www.example.com/profile.jpg'), // Dein Profilbild
                child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // Logik zum Ändern des Profilbilds
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Benutzername
            const Text(
              'John Doe', // Beispielname
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // E-Mail
            const Text(
              'johndoe@example.com', // Beispiel-E-Mail
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Weitere Profiloptionen
            const Text(
              'Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              onTap: () {
                // Logik zum Ändern des Passworts
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language Preferences'),
              onTap: () {
                // Logik zum Ändern der Spracheinstellungen
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notification Settings'),
              onTap: () {
                // Logik zum Ändern der Benachrichtigungseinstellungen
              },
            ),
            const Divider(),

            // Logout Button
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                // Abmelde-Logik hier
                // Zum Beispiel: Get.offAll(() => const LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
