import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/counter.dart';
import 'counters_state.dart';

part 'counters_ctrl.g.dart';

@riverpod
class CountersCtrl extends _$CountersCtrl {
  CountersState build() => CountersState();

  void addCounter({required String title, required int startingNumber}) =>
      state.copyWith(counters: state.counters..add(Counter(count: startingNumber, title: title)));
}
