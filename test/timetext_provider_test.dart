import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_timer_mvvm/model/timer.dart';
import 'package:riverpod_timer_mvvm/view_model/timertext_provider.dart';

class TimerNotifierForTest extends TimerNotifier {
  TimerModel timermodel;

  TimerNotifierForTest(this.timermodel);
  get state => timermodel;
}

void main() {
  const testData = <String>[
    "test",
    "0:0",
  ];
  for (var item in testData) {
    test('time: ${item}', () async {
      final container = ProviderContainer(
        overrides: [
          timerProvider.overrideWithValue(
              TimerNotifierForTest(TimerModel(item, ButtonState.initial)))
        ],
      );
      expect(container.read(timeLeftProvider), item);
    });
  }
}
