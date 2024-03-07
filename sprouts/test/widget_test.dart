import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sprouts/main.dart';

void main() {
  testWidgets('Buttons display test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Print the widget tree for debugging.
    debugDumpApp();

    // Verify that the add plant button is present.
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Verify that the add icon is present on the floating action button.
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Verify that the back button is present.
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
}
