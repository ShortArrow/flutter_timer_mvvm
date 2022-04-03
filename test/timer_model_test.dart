import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_timer_mvvm/model/timer.dart';

void main() {
  test('timermodel', () async {
    const timeLeft = "----";
    const testState = ButtonState.finished;
    final timerModel = TimerModel(timeLeft, testState);
    expect(timerModel.buttonState, testState);
    expect(timerModel.timeLeft, timeLeft);
  });
}
