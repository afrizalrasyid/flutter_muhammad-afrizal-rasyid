import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/main.dart';

void main() {
  testWidgets(
    'Testing Logo Appbar',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(
          find.image(
            const AssetImage('assets/images/icon.png'),
          ),
          findsOneWidget);
    },
  );
  testWidgets(
    'Testing Title Appbar',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('Our Furniture'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Image Cover',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(
          find.image(
            const AssetImage('assets/images/header_couch.jpg'),
          ),
          findsOneWidget);
    },
  );
  testWidgets(
    'Testing Title: Welcome To Our Furniture ',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('Welcome To Our Furniture'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Subtitle: Comfort is our priority',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('Comfort is our priority'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Text: Take a look!',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('Take a look!'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Text: Find everything you need',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('Find everything you need'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Button More',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.widgetWithText(ElevatedButton, 'More'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Image Section 1',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.image(const AssetImage('assets/images/section_1.jpg')),
          findsOneWidget);
    },
  );
  testWidgets(
    'Testing Image Section 2',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.image(const AssetImage('assets/images/section_2.jpg')),
          findsOneWidget);
    },
  );
  testWidgets(
    'Testing Text: Go Visit Us!',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('Go Visit Us!'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Text: We are present in several place',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('We are present in several'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Button Store',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.widgetWithText(ElevatedButton, 'Store'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Title: Contact us',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('Contact us'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Text: Need to get in touch with us? Either fill out the form with your inquiry or find the departement email you like to contact below.',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(
          find.text(
              'Need to get in touch with us? Either fill out the form with your inquiry or find the departement email you like to contact below.'),
          findsOneWidget);
    },
  );
  testWidgets(
    'Testing TextField First Name',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('First name*'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing TextField Last Name',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('Last Name'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing TextField Email',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('Email*'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing TextField Message',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text('What can we help you with?'), findsOneWidget);
    },
  );
  testWidgets(
    'Testing Button Submit',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.widgetWithText(ElevatedButton, 'Submit'), findsOneWidget);
    },
  );
}
