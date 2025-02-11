// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtms_application/widgets/custom_extension.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_TextField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    RxString usernameError = "".obs;
    RxString passwordError = "".obs;
    RxBool isPasswordVisible = false.obs;

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Container(
                    decoration: const BoxDecoration(
                      // Blaues Border
                      shape: BoxShape.circle, // Form als Kreis
                    ),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp6w2RQSwog7ojXSGO-iMYSEDoFLLEIHOEVw&s',
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child; // Bild ist fertig geladen
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        // Fehlerbehandlung, falls Bild nicht geladen werden kann
                        return const Center(
                          child: Icon(
                            Icons.error,
                            size: 50,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextField(
                  label: 'Benutzername',
                  isUsername: true,
                  errorMessage: usernameError,
                  isRequired: true, // Optional: Benutzername ist erforderlich
                  tooltipMessage:
                      "Bitte eine gültige E-Mail oder Telefonnummer eingeben!",
                  onChanged: (value) => authController.username.value = value,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Passwort',
                  isPassword: true,
                  errorMessage: passwordError,
                  isPasswordVisible: isPasswordVisible,
                  tooltipMessage:
                      "Ihr Passwort muss mindestens 8 Zeichen lang sein.",
                  onChanged: (value) => authController.password.value = value,
                ),
                const SizedBox(height: 30),
                Obx(() => ElevatedButton(
                      onPressed: authController.isLoading.value
                          ? null
                          : () => authController.login(),
                      child: authController.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text('Einloggen'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
