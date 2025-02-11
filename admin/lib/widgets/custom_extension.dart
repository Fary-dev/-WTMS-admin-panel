import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension CustomSnackbar on BuildContext {
  void showCustomSnackbar(String message, {Color? bgColor, Color? textColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info, color: textColor ?? Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: textColor ?? Colors.white),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: textColor ?? Colors.white),
              onPressed: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(this).size.height - 100,
          right: 10,
          left: MediaQuery.of(this).size.width * 0.6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: bgColor ?? Colors.black),
        ),
        backgroundColor: bgColor ?? Colors.black,
      ),
    );
  }
}

