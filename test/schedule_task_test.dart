import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_mastermind/screens/schedule_task.dart';

void main() {
  testWidgets('Add Event Test', (WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(0), 'New Event');
    await tester.enterText(find.byType(TextField).at(1), '5');
    await tester.tap(find.byIcon(Icons.calendar_today));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pump();
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(find.text('New Event'), findsOneWidget);
    expect(find.text('Items: 5'), findsOneWidget);
  });

  testWidgets('Remove Event Test', (WidgetTester tester) async {
    expect(find.text('Buying Fruits'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();
    expect(find.text('Buying Fruits'), findsNothing);
  });

  testWidgets('UI Elements Test', (WidgetTester tester) async {
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('BUY'), findsOneWidget);
  });
}

class ScheduleTask {
}
