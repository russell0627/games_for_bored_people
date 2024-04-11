import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class EndlessDungeonState {
  static const Duration inputTimerDuration = Duration(seconds: 1);

  final int dungeonLevel;
  final CircularCountDownTimer? attackTimer1;
  final CircularCountDownTimer? attackTimer2;
  final CircularCountDownTimer? attackTimer3;

  EndlessDungeonState({required this.dungeonLevel, this.attackTimer1, this.attackTimer2, this.attackTimer3,});

  EndlessDungeonState copyWith({
    int? dungeonLevel,
  }) {
    return EndlessDungeonState(
      dungeonLevel: dungeonLevel ?? this.dungeonLevel,
    );
  }

}

