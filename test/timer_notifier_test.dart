import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_timer_mvvm/model/timer.dart';
import 'package:riverpod_timer_mvvm/view_model/button_provider.dart';
import 'package:riverpod_timer_mvvm/view_model/timertext_provider.dart';

void main() {
  test('timerProvider', () async {
    final container = ProviderContainer();
    expect(container.read(timeLeftProvider), '00:10');
    expect(container.read(buttonProvider), ButtonState.initial);
    container.read(timerProvider.notifier).start();
    expect(container.read(buttonProvider), ButtonState.started);
    container.read(timerProvider.notifier).pause();
    expect(container.read(buttonProvider), ButtonState.paused);
    container.read(timerProvider.notifier).start();
    expect(container.read(buttonProvider), ButtonState.started);
    container.read(timerProvider.notifier).pause();
    expect(container.read(buttonProvider), ButtonState.paused);
    container.read(timerProvider.notifier).start();
    expect(container.read(buttonProvider), ButtonState.started);
    container.read(timerProvider.notifier).reset();
    expect(container.read(buttonProvider), ButtonState.initial);
    container.read(timerProvider.notifier).start();
    expect(container.read(buttonProvider), ButtonState.started);
    container.read(timerProvider.notifier).pause();
    expect(container.read(buttonProvider), ButtonState.paused);
    container.read(timerProvider.notifier).reset();
    expect(container.read(buttonProvider), ButtonState.initial);
  });
}
