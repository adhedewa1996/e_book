import 'package:e_books/commons/widgets/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ReadProgress renders correct progress width', (WidgetTester tester) async {
    const double containerWidth = 200;
    const int progress = 50;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReadProgress(width: containerWidth, progress: progress, color: Colors.blue, backgroundColor: Colors.grey),
        ),
      ),
    );

    // Allow async initState and animation to complete
    await tester.pump(Duration(seconds: 1));
    await tester.pump();
    await tester.pump(Duration(seconds: 5));

    // Find the inner progress bar (the second AnimatedContainer)
    final animatedContainers = find.byType(AnimatedContainer);
    expect(animatedContainers, findsNWidgets(2)); // Outer and inner

    // Get size of the second (inner) AnimatedContainer
    final Size progressSize = tester.getSize(animatedContainers.at(1));

    // Expected progress width
    expect(progressSize.width, equals(containerWidth * 0.5));
    expect(progressSize.height, equals(6));
  });

  testWidgets('ReadProgress with null progress shows zero width', (WidgetTester tester) async {
    const double containerWidth = 150;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReadProgress(
            width: containerWidth,
            progress: null, // should default to 0%
            color: Colors.red,
          ),
        ),
      ),
    );

    await tester.pump(Duration(seconds: 1));
    await tester.pump();
    await tester.pump(Duration(seconds: 5));

    final animatedContainers = find.byType(AnimatedContainer);
    final Size progressSize = tester.getSize(animatedContainers.at(1));

    expect(progressSize.width, equals(0));
    expect(progressSize.height, equals(6));
  });
}
