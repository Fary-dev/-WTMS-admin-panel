import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';  // Hier das Cupertino-Paket importieren
import 'dart:io'; // für die Plattform-Abfrage

// Android-spezifische Schaltfläche
class AndroidButton extends StatelessWidget {
  const AndroidButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Aktion bei Klick auf den Button
        print('Android Button gedrückt!');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Hintergrundfarbe
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
      ),
      child: const Text('Android Button'),
    );
  }
}

// iOS-spezifische Schaltfläche
class IOSButton extends StatelessWidget {
  const IOSButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        // Aktion bei Klick auf den Button
        print('iOS Button gedrückt!');
      },
      color: CupertinoColors.activeGreen, // Hintergrundfarbe
      child: const Text('iOS Button'),
    );
  }
}

// Web-spezifische Schaltfläche
class WebButton extends StatelessWidget {
  const WebButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Aktion bei Klick auf den Button
        print('Web Button gedrückt!');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Hintergrundfarbe
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Padding
        textStyle: const TextStyle(fontSize: 20), // Textstil
      ),
      child: const Text('Web Button'),
    );
  }
}

// CustomButton, das je nach Plattform den richtigen Button anzeigt
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Anpassung des Aussehens des Buttons je nach Plattform
    if (Platform.isAndroid) {
      return const AndroidButton();
    } else if (Platform.isIOS) {
      return const IOSButton();
    } else {
      return const WebButton(); // Web-spezifische Version
    }
  }
}
