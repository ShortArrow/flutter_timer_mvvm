import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_timer_mvvm/model/timer.dart';
import 'package:riverpod_timer_mvvm/view/timertext_widget.dart';
import 'package:riverpod_timer_mvvm/view_model/timertext_provider.dart';

class TimerNotifierForTest extends TimerNotifier {
  TimerModel timermodel;

  TimerNotifierForTest(this.timermodel);
  get state => timermodel;
}

final testTarget = MaterialApp(
  home: Scaffold(
    body: TimerTextWidget(),
  ),
);

void main() {
  const testData = <String>[
    "test",
    "fake",
    "00:10",
    "00:00",
  ];
  for (var item in testData) {
    testWidgets('state: ${item}', (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: testTarget,
        overrides: [
          timerProvider.overrideWithValue(
              TimerNotifierForTest(TimerModel(item, ButtonState.finished)))
        ],
      ));
      expect(find.text(item), findsOneWidget);
    });
  }
}
