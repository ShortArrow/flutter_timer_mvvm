// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_timer_mvvm/model/timer.dart';
import 'package:riverpod_timer_mvvm/view/button_widget.dart';
import 'package:riverpod_timer_mvvm/view_model/button_provider.dart';

final testTarget = MaterialApp(
  home: Scaffold(
    body: Consumer(builder: (context, ref, _) {
      return ButtonsContainer();
    }),
  ),
);
void main() {
  testWidgets('finished', (WidgetTester tester) async {
    // finished
    await tester.pumpWidget(ProviderScope(
      child: testTarget,
      overrides: [buttonProvider.overrideWithValue(ButtonState.finished)],
    ));
    expect(find.byIcon(Icons.play_arrow), findsNothing);
    expect(find.byIcon(Icons.pause), findsNothing);
    expect(find.byIcon(Icons.replay), findsOneWidget);
  });
}
