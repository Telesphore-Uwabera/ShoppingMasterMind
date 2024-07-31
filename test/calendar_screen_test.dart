import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_mastermind/screens/calendar_screen.dart';
import 'package:shopping_mastermind/screens/schedule_task.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  testWidgets('CalendarScreen displays correctly and navigates to ScheduleTask', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CalendarScreen(),
      ),
    );

    // Verify that the CalendarScreen displays a TableCalendar
    expect(find.byType(TableCalendar), findsOneWidget);

    // Verify that the AppBar has the correct title
    expect(find.text('Calendar Screen'), findsOneWidget);

    // Verify that the FloatingActionButton is present
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Tap the FloatingActionButton
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify that the navigation to ScheduleTask occurred
    expect(find.byType(ScheduleTask), findsOneWidget);
    expect(find.text('Schedule Task'), findsOneWidget);
  });
}
