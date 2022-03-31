// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_timer_mvvm/view/button_widget.dart';

final testTarget = ProviderScope(
  child: MaterialApp(
    home: Scaffold(
      body: Consumer(builder: (context, ref, _) {
        return ButtonsContainer();
      }),
    ),
  ),
);
void main() {
  testWidgets('first start', (WidgetTester tester) async {
    // ▶
    await tester.pumpWidget(testTarget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsNothing);
    expect(find.byIcon(Icons.replay), findsNothing);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsNothing);
    expect(find.byIcon(Icons.pause), findsOneWidget);
    expect(find.byIcon(Icons.replay), findsOneWidget);
  });
  testWidgets('pause', (WidgetTester tester) async {
    // ▶⏸▶
    await tester.pumpWidget(testTarget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsNothing);
    expect(find.byIcon(Icons.pause), findsOneWidget);
    await tester.tap(find.byIcon(Icons.pause));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsNothing);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsNothing);
    expect(find.byIcon(Icons.pause), findsOneWidget);
  });
  testWidgets('replay only', (WidgetTester tester) async {
    // ▶🔄
    await tester.pumpWidget(testTarget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsNothing);
    expect(find.byIcon(Icons.pause), findsOneWidget);
    expect(find.byIcon(Icons.replay), findsOneWidget);
    await tester.tap(find.byIcon(Icons.replay));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsNothing);
    expect(find.byIcon(Icons.replay), findsNothing);
  });
  testWidgets('replay from pause', (WidgetTester tester) async {
    // ▶⏸🔄
    await tester.pumpWidget(testTarget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsNothing);
    expect(find.byIcon(Icons.pause), findsOneWidget);
    expect(find.byIcon(Icons.replay), findsOneWidget);
    await tester.tap(find.byIcon(Icons.pause));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsNothing);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.tap(find.byIcon(Icons.replay));
    await tester.pump();
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsNothing);
    expect(find.byIcon(Icons.replay), findsNothing);
  });
  // add test of xxx
  // TODO: refresh from pause
  // TODO: refresh from finish
  // TODO: normal finish
  // TODO: finish from pause
}
