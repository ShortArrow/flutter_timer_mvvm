import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_timer_mvvm/model/timer.dart';
import 'package:riverpod_timer_mvvm/view_model/button_provider.dart';
import 'package:riverpod_timer_mvvm/view_model/timertext_provider.dart';

class TimerNotifierForTest extends TimerNotifier {
  TimerModel timermodel;

  TimerNotifierForTest(this.timermodel);
  get state => timermodel;
}

void main() {
  for (var oneOfState in ButtonState.values) {
    test('state: ${oneOfState.name}', () async {
      final container = ProviderContainer(
        overrides: [
          timerProvider.overrideWithValue(
              TimerNotifierForTest(TimerModel("000", oneOfState)))
        ],
      );
      expect(container.read(buttonProvider), oneOfState);
    });
  }
}
