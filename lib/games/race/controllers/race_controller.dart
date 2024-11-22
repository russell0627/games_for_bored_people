import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'race_state.dart';

part 'race_controller.g.dart';

@riverpod
class RaceController extends _$RaceController {
  RaceState build() => RaceState(rng: Random());

  void progressRace() {
    final int roll1 = state.rng.nextInt(6) + 1;
    final int roll2 = state.rng.nextInt(6) + 1;

    switch (roll1) {
      case 1:
        state = state.copyWith(
            raceLane1: RaceLane(
                length: state.raceLane1.length,
                progress: state.raceLane1.progress + 1));
      case 2:
        state = state.copyWith(
            raceLane2: RaceLane(
                length: state.raceLane2.length,
                progress: state.raceLane2.progress + 1));

      case 3:
        state = state.copyWith(
            raceLane3: RaceLane(
                length: state.raceLane3.length,
                progress: state.raceLane3.progress + 1));

      case 4:
        state = state.copyWith(
            raceLane4: RaceLane(
                length: state.raceLane4.length,
                progress: state.raceLane4.progress + 1));

      case 5:
        state = state.copyWith(
            raceLane5: RaceLane(
                length: state.raceLane5.length,
                progress: state.raceLane5.progress + 1));

      case 6:
        state = state.copyWith(
            raceLane6: RaceLane(
                length: state.raceLane6.length,
                progress: state.raceLane6.progress + 1));
    }
    switch (roll2) {
      case 1:
        state = state.copyWith(
            raceLane1: RaceLane(
                length: state.raceLane1.length,
                progress: state.raceLane1.progress + 1));
      case 2:
        state = state.copyWith(
            raceLane2: RaceLane(
                length: state.raceLane2.length,
                progress: state.raceLane2.progress + 1));

      case 3:
        state = state.copyWith(
            raceLane3: RaceLane(
                length: state.raceLane3.length,
                progress: state.raceLane3.progress + 1));

      case 4:
        state = state.copyWith(
            raceLane4: RaceLane(
                length: state.raceLane4.length,
                progress: state.raceLane4.progress + 1));

      case 5:
        state = state.copyWith(
            raceLane5: RaceLane(
                length: state.raceLane5.length,
                progress: state.raceLane5.progress + 1));

      case 6:
        state = state.copyWith(
            raceLane6: RaceLane(
                length: state.raceLane6.length,
                progress: state.raceLane6.progress + 1));
    }
    if (state.raceLane1.progress == state.raceLane1.length) {
     state = state.copyWith(winFound: 1);
    }
    if (state.raceLane2.progress == state.raceLane2.length) {
     state = state.copyWith(winFound: 2);
    }
    if (state.raceLane3.progress == state.raceLane3.length) {
     state = state.copyWith(winFound: 3);
    }
    if (state.raceLane4.progress == state.raceLane4.length) {
     state = state.copyWith(winFound: 4);
    }
    if (state.raceLane5.progress == state.raceLane5.length) {
     state = state.copyWith(winFound: 5);
    }
    if (state.raceLane6.progress == state.raceLane6.length) {
     state = state.copyWith(winFound: 6);
    }
  }
}

