import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rasyid/prioritas_2.dart';

void main() {
  testWidgets(
    'Testing Button Home',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Prioritas2(),
        ),
      );

      expect(find.widgetWithText(ElevatedButton, 'Home'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Button Prioritas 1',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Prioritas2(),
        ),
      );

      expect(
          find.widgetWithText(ElevatedButton, 'Prioritas 1'), findsOneWidget);
    },
  );
}
