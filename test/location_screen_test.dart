import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_mastermind/screens/location_screen.dart';

void main() {
  testWidgets('LocationSelectionScreen displays all dropdowns correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LocationSelectionScreen()));

    expect(find.text('District'), findsOneWidget);
    expect(find.text('Sector'), findsNothing);
    expect(find.text('Cell'), findsNothing);
    expect(find.text('Village'), findsNothing);
    expect(find.text('House Code'), findsNothing);
  });

  testWidgets('Selecting a district displays sectors', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LocationSelectionScreen()));

    await tester.tap(find.text('District'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gasabo').last);
    await tester.pumpAndSettle();

    expect(find.text('Sector'), findsOneWidget);
  });

  testWidgets('Selecting a sector displays cells', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LocationSelectionScreen()));

    await tester.tap(find.text('District'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gasabo').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sector'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Remera').last);
    await tester.pumpAndSettle();

    expect(find.text('Cell'), findsOneWidget);
  });

  testWidgets('Selecting a cell displays villages', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LocationSelectionScreen()));

    await tester.tap(find.text('District'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gasabo').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sector'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Remera').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cell'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Remera 1').last);
    await tester.pumpAndSettle();

    expect(find.text('Village'), findsOneWidget);
  });

  testWidgets('Selecting a village displays house code input', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LocationSelectionScreen()));

    await tester.tap(find.text('District'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gasabo').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sector'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Remera').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cell'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Remera 1').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Village'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Village A').last);
    await tester.pumpAndSettle();

    expect(find.text('House Code'), findsOneWidget);
  });

  testWidgets('Saving location shows confirmation dialog', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LocationSelectionScreen()));

    await tester.tap(find.text('District'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gasabo').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sector'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Remera').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cell'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Remera 1').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Village'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Village A').last);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '12345');
    await tester.tap(find.text('Save Location'));
    await tester.pumpAndSettle();

    expect(find.text('Location Saved'), findsOneWidget);
    expect(find.text('Your location has been saved: Gasabo, Remera, Remera 1, Village A, 12345'), findsOneWidget);
  });
}
