import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_mastermind/screens/all_items_screen.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUser extends Mock implements User {}
class MockDatabaseReference extends Mock implements DatabaseReference {}
class MockDataSnapshot extends Mock implements DataSnapshot {}
class MockDatabaseEvent extends Mock implements DatabaseEvent {}

void main() {
  late MockFirebaseAuth mockAuth;
  late MockUser mockUser;
  late MockDatabaseReference mockDatabaseReference;

  setUp(() {
    mockAuth = MockFirebaseAuth();
    mockUser = MockUser();
    mockDatabaseReference = MockDatabaseReference();
  });

  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('AllItems screen loads and displays items', (WidgetTester tester) async {
    when(mockAuth.currentUser).thenReturn(mockUser);
    when(mockUser.uid).thenReturn('testuid');
    when(mockDatabaseReference.onValue).thenAnswer((_) {
      final MockDatabaseEvent mockDatabaseEvent = MockDatabaseEvent();
      final MockDataSnapshot mockDataSnapshot = MockDataSnapshot();

      when(mockDatabaseEvent.snapshot).thenReturn(mockDataSnapshot);
      when(mockDataSnapshot.value).thenReturn({
        'item1': {
          'title': 'Item 1',
          'isChecked': false,
          'icon': Icons.check.codePoint,
        },
        'item2': {
          'title': 'Item 2',
          'isChecked': true,
          'icon': Icons.check.codePoint,
        },
      });

      return Stream.value(mockDatabaseEvent);
    });

    await tester.pumpWidget(createWidgetForTesting(child: AllItems()));
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
  });

  testWidgets('Add item dialog appears and adds an item', (WidgetTester tester) async {
    when(mockAuth.currentUser).thenReturn(mockUser);
    when(mockUser.uid).thenReturn('testuid');

    await tester.pumpWidget(createWidgetForTesting(child: AllItems()));
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Add Item'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'New Item');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    verify(mockDatabaseReference.push().set({
      'title': 'New Item',
      'isChecked': false,
      'icon': Icons.add.codePoint,
    })).called(1);
  });

  testWidgets('Bottom navigation works', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: AllItems()));
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    await tester.tap(find.byIcon(Icons.calendar_today));
    await tester.pumpAndSettle();
  });
}
