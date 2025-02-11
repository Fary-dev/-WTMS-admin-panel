import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtms_application/screens/home_page.dart';

import '../pages/login-page.dart';

class WebMobileLayout extends StatelessWidget {
  const WebMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Web Mobile Version',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text('Dies ist die Mobile-Version für Web.'),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
