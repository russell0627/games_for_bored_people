import '../models/counter.dart';

class CountersState {
  final List<Counter> counters;

  CountersState({this.counters = const []});

  CountersState copyWith({
    List<Counter>? counters,
  }) {
    return CountersState(
      counters: counters ?? this.counters,
    );
  }
}