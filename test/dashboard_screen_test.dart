import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_mastermind/screens/dashboard_screen.dart';

class MockUser extends Mock implements User {}

void main() {
  group('DashboardScreen', () {
    testWidgets('displays welcome message', (WidgetTester tester) async {
      final mockUser = MockUser();
      when(mockUser.displayName).thenReturn('Test User');

      await tester.pumpWidget(MaterialApp(home: DashboardScreen(user: mockUser)));

      expect(find.text('Welcome, Test User!'), findsOneWidget);
    });

    testWidgets('displays charts', (WidgetTester tester) async {
      final mockUser = MockUser();
      when(mockUser.displayName).thenReturn('Test User');

      await tester.pumpWidget(MaterialApp(home: DashboardScreen(user: mockUser)));

      expect(find.byType(BarChart), findsOneWidget);
      expect(find.byType(LineChart), findsOneWidget);
      expect(find.byType(PieChart), findsOneWidget);
    });

    testWidgets('navigates to Calendar screen on tap', (WidgetTester tester) async {
      final mockUser = MockUser();
      when(mockUser.displayName).thenReturn('Test User');

      await tester.pumpWidget(MaterialApp(
        home: DashboardScreen(user: mockUser),
        routes: {
          '/calendar': (context) => Scaffold(body: Text('Calendar Screen')),
        },
      ));

      await tester.tap(find.byIcon(Icons.calendar_month));
      await tester.pumpAndSettle();

      expect(find.text('Calendar Screen'), findsOneWidget);
    });

    testWidgets('navigates to Items list screen on tap', (WidgetTester tester) async {
      final mockUser = MockUser();
      when(mockUser.displayName).thenReturn('Test User');

      await tester.pumpWidget(MaterialApp(
        home: DashboardScreen(user: mockUser),
        routes: {
          '/items_list': (context) => Scaffold(body: Text('Items List Screen')),
        },
      ));

      await tester.tap(find.byIcon(Icons.list));
      await tester.pumpAndSettle();

      expect(find.text('Items List Screen'), findsOneWidget);
    });
  });
}

class PieChart {
}

class LineChart {
}

class BarChart {
}
