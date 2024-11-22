import 'dart:math';

class RaceLane {
  final int length;
  final int progress;

  const RaceLane({this.length = 8, this.progress = 0});
}

class RaceState {
  static const RaceLane defaultRaceLane = RaceLane();

  final Random rng;
  final RaceLane raceLane1;
  final RaceLane raceLane2;
  final RaceLane raceLane3;
  final RaceLane raceLane4;
  final RaceLane raceLane5;
  final RaceLane raceLane6;
  final int winFound;
  RaceState({
    this.winFound = 0,
    required this.rng,
    this.raceLane1 = defaultRaceLane,
    this.raceLane2 = defaultRaceLane,
    this.raceLane3 = defaultRaceLane,
    this.raceLane4 = defaultRaceLane,
    this.raceLane5 = defaultRaceLane,
    this.raceLane6 = defaultRaceLane,
  });

  RaceState copyWith({
    RaceLane? raceLane1,
    RaceLane? raceLane2,
    RaceLane? raceLane3,
    RaceLane? raceLane4,
    RaceLane? raceLane5,
    RaceLane? raceLane6,
    int? winFound,
  }) {
    return RaceState(
      raceLane1: raceLane1 ?? this.raceLane1,
      raceLane2: raceLane2 ?? this.raceLane2,
      raceLane3: raceLane3 ?? this.raceLane3,
      raceLane4: raceLane4 ?? this.raceLane4,
      raceLane5: raceLane5 ?? this.raceLane5,
      raceLane6: raceLane6 ?? this.raceLane6,
      winFound: winFound ?? this.winFound,
      rng: rng,
    );
  }
}
