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

    expect(find.byType(TableCalendar), findsOneWidget);
    expect(find.text('Calendar Screen'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(ScheduleTask), findsOneWidget);
    expect(find.text('Schedule Task'), findsOneWidget);
  });
}
