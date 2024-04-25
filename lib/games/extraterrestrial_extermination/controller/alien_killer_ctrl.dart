import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'alien_killer_state.dart';

part 'alien_killer_ctrl.g.dart';

@riverpod
class AlienKillerCtrl extends _$AlienKillerCtrl {
  @override
  AlienKillerState build() => AlienKillerState(spawnTimer: Timer(Duration(seconds: 5), () {}), score: 0, alienNumbers: {
        VehicleSide.front: 1,
        VehicleSide.left: 0,
        VehicleSide.right: 0,
      });

  void addAlienToSide(VehicleSide side) {
    state = state.copyWith(alienNumbers: {
      VehicleSide.front: state.alienNumbers[VehicleSide.front]! + 1,
      // VehicleSide.left: state.alienNumbers[VehicleSide.left]! + 1,
      // VehicleSide.right: state.alienNumbers[VehicleSide.right]! + 1,
    });
  }

  void killAlien(VehicleSide side) {
    if (side == VehicleSide.front) {
      state = state.copyWith(alienNumbers: {
        VehicleSide.front: state.alienNumbers[VehicleSide.front]! - 1,
      });
    } else if (side == VehicleSide.left) {
      state.copyWith(alienNumbers: {
        VehicleSide.left: state.alienNumbers[VehicleSide.left]! - 1,
      });
    } else if (side == VehicleSide.right) {
      state.copyWith(alienNumbers: {
        VehicleSide.right: state.alienNumbers[VehicleSide.right]! - 1,
      });
    }
    state = state.copyWith(score: state.score + 1);
  }
}
