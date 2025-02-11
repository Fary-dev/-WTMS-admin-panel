import 'package:flutter/material.dart';
import 'web_layouts/web_desktop_layout.dart';
import 'web_layouts/web_mobile_layout.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Web Version')),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const WebDesktopLayout();
            } else {
              return const WebMobileLayout();
            }
          },
        ),
      ),
    );
  }
}
