import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isEmail;
  final bool isUsername;
  final String? tooltipMessage;
  final RxBool? isPasswordVisible;
  final RxString? errorMessage;
  final bool isRequired; // Markiert, ob das Feld erforderlich ist

  const CustomTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.keyboardType = TextInputType.text, // Standard Text Input
    this.isPassword = false,
    this.isEmail = false,
    this.isUsername = false,
    this.tooltipMessage,
    this.isPasswordVisible,
    this.errorMessage,
    this.isRequired = false, // Standardmäßig nicht erforderlich
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            obscureText:
                isPassword ? !(isPasswordVisible?.value ?? false) : false,
            keyboardType: keyboardType,
            onChanged: (value) {
              // Validierungen basierend auf den Eingabefeldtypen
              if (isEmail && !GetUtils.isEmail(value)) {
                errorMessage?.value =
                    "Bitte eine gültige E-Mail-Adresse eingeben!";
              }
              // Passwort Validierung (z.B. min. 6 Zeichen)
              else if (isPassword && value.length < 8) {
                errorMessage?.value =
                    "Passwort muss mindestens 8 Zeichen lang sein!";
              }
              // Benutzername Validierung (nicht leer)
              else if (isUsername && value.isEmpty) {
                errorMessage?.value = "Benutzername darf nicht leer sein!";
              }
              // Weitere allgemeine Validierungen (falls benötigt)
              else if (isRequired && value.isEmpty) {
                errorMessage?.value = "$label ist erforderlich!";
              } else {
                errorMessage?.value = ""; // Kein Fehler
              }

              onChanged(value);
            },
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
              errorText: errorMessage?.value.isEmpty == true
                  ? null
                  : errorMessage?.value,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isPassword)
                    IconButton(
                      icon: Icon(
                        (isPasswordVisible?.value ?? false)
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        if (isPasswordVisible != null) {
                          isPasswordVisible!.value = !isPasswordVisible!.value;
                        }
                      },
                    ),
                  if (tooltipMessage != null)
                    Tooltip(
                      message: tooltipMessage,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.info_outline, color: Colors.blue),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      );
    });
  }
}
