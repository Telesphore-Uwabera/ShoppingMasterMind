import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_mastermind/main.dart';



void main() {
  testWidgets('ItemsListScreen displays all items correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('All Items'), findsOneWidget);
    expect(find.text('Shoes'), findsOneWidget);
    expect(find.text('Jeans'), findsOneWidget);
  });

  testWidgets('Add item dialog appears and adds item to the list', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Choose an Item'), findsOneWidget);

    await tester.tap(find.text('Books'));
    await tester.pumpAndSettle();

    expect(find.text('Books'), findsOneWidget);
  });

  testWidgets('Remove item from the list', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Shoes'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove).first);
    await tester.pumpAndSettle();

    expect(find.text('Shoes'), findsNothing);
  });

  testWidgets('Toggle item as bought', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Shoes'), findsOneWidget);

    await tester.tap(find.text('BUY').first);
    await tester.pumpAndSettle();

    expect(find.text('Your command is successfully submitted!'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.text('Your command is successfully submitted!'), findsNothing);
  });

  testWidgets('Update item quantity and time', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('Shoes'));
    await tester.pumpAndSettle();

    expect(find.text('Update Item'), findsOneWidget);

    await tester.tap(find.text('Quantity:'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('2').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Time to Buy:'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();

    expect(find.text('Shoes'), findsOneWidget);
  });
}
