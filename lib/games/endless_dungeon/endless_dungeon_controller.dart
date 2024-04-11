import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data/attacks.dart';
import 'endless_dungeon_state.dart';

part 'endless_dungeon_controller.g.dart';

@riverpod
class EndlessDungeonController extends _$EndlessDungeonController {
  @override
  EndlessDungeonState build() => EndlessDungeonState(
        dungeonLevel: 1,
        attackTimer1: CircularCountDownTimer(
          width: 100,
          height: 100,
          duration: attacks["1"]!.maxCooldown,
          fillColor: Colors.blue,
          ringColor: Colors.blueAccent,
        ),
        attackTimer2: CircularCountDownTimer(
          width: 100,
          height: 100,
          duration: attacks["2"]!.maxCooldown,
          fillColor: Colors.blue,
          ringColor: Colors.blueAccent,
        ),
        attackTimer3: CircularCountDownTimer(
          width: 100,
          height: 100,
          duration: attacks["3"]!.maxCooldown,
          fillColor: Colors.blue,
          ringColor: Colors.blueAccent,
        ),
      );
}
