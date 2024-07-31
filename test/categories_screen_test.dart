import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_mastermind/screens/categories_screen.dart';


void main() {
  group('ShoppingMastermindHomePage', () {
    testWidgets('displays correct pages when navigation items are tapped', (WidgetTester tester) async {
      await tester.pumpWidget(CategoriesScreen());
      expect(find.text('Categories'), findsOneWidget);
      expect(find.text("Today's plan"), findsOneWidget);
      await tester.tap(find.byIcon(Icons.calendar_month_rounded));
      await tester.pumpAndSettle();
      expect(find.text('Calendar Page'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.note_add_rounded));
      await tester.pumpAndSettle();
      expect(find.text('Notes Page'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      expect(find.text('Settings Page'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();
      expect(find.text("Today's plan"), findsOneWidget);
    });

    testWidgets('displays categories and tasks correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.text('Category 1'), findsOneWidget);
      expect(find.text('Category 2'), findsOneWidget);
      expect(find.text('Category 3'), findsOneWidget);
      expect(find.text('Category 4'), findsOneWidget);
      expect(find.text('Category 5'), findsOneWidget);
      expect(find.text('Category 6'), findsOneWidget);

      // Verify Today's plan tasks are displayed
      expect(find.text('Product 1'), findsOneWidget);
      expect(find.text('10:00 AM'), findsOneWidget);
      expect(find.text('Product 2'), findsOneWidget);
      expect(find.text('11:00 AM'), findsOneWidget);
      expect(find.text('Product 3'), findsOneWidget);
      expect(find.text('12:00 PM'), findsOneWidget);
      await tester.tap(find.text('Product 1'));
      await tester.pump();
      expect(find.byType(Radio<int>), findsNWidgets(3));
    });
  });
}
