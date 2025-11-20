import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matrix_waiting_screen/matrix_waiting_screen.dart';

void main() {
  testWidgets('MatrixWaitingScreen renders correctly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: MatrixWaitingScreen(title: 'TESTING'),
      ),
    );

    // Verify that the title is displayed.
    expect(find.text('TESTING'), findsOneWidget);

    // Verify that the CircularProgressIndicator is displayed.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
