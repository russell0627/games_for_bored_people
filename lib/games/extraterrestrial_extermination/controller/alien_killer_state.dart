import 'dart:async';

class AlienKillerState {
  final Timer spawnTimer;
  final int score;
  final Map<VehicleSide, int> alienNumbers;

  AlienKillerState({
    required this.spawnTimer,
    required this.score,
    required this.alienNumbers,
  });
  AlienKillerState copyWith({
    int? score,
    Map<VehicleSide, int>? alienNumbers,
  }) {
    return AlienKillerState(
      score: score ?? this.score, spawnTimer: spawnTimer, alienNumbers: alienNumbers ?? this.alienNumbers,
    );
  }

}

enum VehicleSide {
  front,
  left,
  right,
}

