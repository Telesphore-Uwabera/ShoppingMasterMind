import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_mastermind/screens/faq_screen.dart';


void main() {
  testWidgets('FAQScreen displays tabs correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FAQScreen()));

    expect(find.text('Feedback'), findsOneWidget);
    expect(find.text('FAQs'), findsOneWidget);
    expect(find.text('What\'s New'), findsOneWidget);
  });

  testWidgets('FAQScreen displays feedback tab', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FAQScreen()));

    await tester.tap(find.text('Feedback'));
    await tester.pumpAndSettle();

    expect(find.text('Feedback'), findsWidgets);
  });

  testWidgets('FAQScreen displays FAQs tab', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FAQScreen()));

    await tester.tap(find.text('FAQs'));
    await tester.pumpAndSettle();

    expect(find.text('Search using keywords'), findsOneWidget);
    expect(find.text('About Shopping Mastermind'), findsOneWidget);
  });

  testWidgets('FAQScreen displays What\'s New tab', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FAQScreen()));

    await tester.tap(find.text('What\'s New'));
    await tester.pumpAndSettle();

    expect(find.text('Add New Question'), findsOneWidget);
    expect(find.text('What\'s New'), findsWidgets);
  });

  testWidgets('FAQScreen displays FAQ items correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FAQScreen()));

    await tester.tap(find.text('FAQs'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('About Shopping Mastermind'));
    await tester.pumpAndSettle();

    expect(find.text('What is Shopping Mastermind?'), findsOneWidget);
    expect(find.text('Shopping Mastermind is a simple app designed to enhance the shopping experience by providing users with a comprehensive tool for managing their shopping lists.'), findsOneWidget);
  });

  testWidgets('FAQScreen shows Add New Question dialog', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FAQScreen()));

    await tester.tap(find.text('What\'s New'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add New Question'));
    await tester.pumpAndSettle();

    expect(find.text('Add New Question'), findsOneWidget);
    expect(find.text('Question'), findsOneWidget);
    expect(find.text('Answer'), findsOneWidget);
  });

  testWidgets('FAQScreen adds new question and answer', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FAQScreen()));

    await tester.tap(find.text('What\'s New'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add New Question'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'New Question?');
    await tester.enterText(find.byType(TextField).at(1), 'New Answer.');

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Add New Question'), findsNothing);
  });
}
