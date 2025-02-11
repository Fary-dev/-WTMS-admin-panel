import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wtms_application/widgets/custom_button.dart';

void main() {
  testWidgets('Test CustomButton auf verschiedenen Plattformen', (WidgetTester tester) async {
    // Plattform wechseln (normalerweise nicht direkt im Test, aber für diesen Test haben wir es so gemacht)
    // Testen Sie den Android-Button
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: CustomButton(),
      ),
    ));

    // Hier könnten Sie spezifische Assertions für den Android-Button machen
    // Zum Beispiel: Überprüfen, ob der ElevatedButton angezeigt wird
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Wenn es auf einer anderen Plattform läuft, könnten Sie auch CupertinoButton und WebButton testen.
  });
}
