import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rasyid/prioritas_1.dart';

void main() {
  testWidgets('Testing Icon Handphone', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(find.widgetWithText(AppBar, 'Contacts'), findsOneWidget);
  });
  testWidgets('Testing Icon Handphone', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(find.byIcon(Icons.phone_android), findsOneWidget);
  });
  testWidgets('Testing Title: Create New Contacts',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(find.text('Create New Contacts'), findsOneWidget);
  });
  testWidgets('Testing Description Text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(
        find.text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.'),
        findsOneWidget);
  });
  testWidgets('Testing TextField Name', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(find.widgetWithText(TextField, 'Name'), findsOneWidget);
  });
  testWidgets('Testing TextField Number', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(find.widgetWithText(TextField, 'Nomor'), findsOneWidget);
  });
  testWidgets('Testing TextButton Date', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(find.widgetWithText(TextButton, 'Select'), findsOneWidget);
  });
  testWidgets('Testing Button Pick Color', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(find.widgetWithText(ElevatedButton, 'Pick Color'), findsOneWidget);
  });
  testWidgets('Testing Button Pick and Open File', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(find.widgetWithText(ElevatedButton, 'Pick and Open File'),
        findsOneWidget);
  });
  testWidgets('Testing Button Submit', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Prioritas1(),
      ),
    );

    expect(find.widgetWithText(ElevatedButton, 'Submit'), findsOneWidget);
  });
}
