import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'horror_bus_state.dart';

part "horror_bus_ctrl.g.dart";

final rng = Random();

@riverpod
class HorrorBusCtrl extends _$HorrorBusCtrl {
  HorrorBusState build() => HorrorBusState();

  void resetGame() {
    resetStudents();
  }

  void resetStudents({int studentCount = 20}) {
    final rng = Random();

    List<Student> newStudents = [];

    for (int i = 0; i < studentCount; i++) {
      newStudents.add(Student(busStation: rng.nextInt(5) + 1));
    }
  }

  void move({required BusMovementDirection movementDirection, required bool movementIntoOffroad}) {
    if (movementIntoOffroad) {
      state.copyWith(movementPoints: state.movementPoints - 2);
    } else {
      state.copyWith(movementPoints: state.movementPoints - 1);
    }

    if (movementDirection == BusMovementDirection.forward) {
      state.copyWith(yPosition: state.yPosition + 1);
      if(state.busFollowingMonster != null) {
        if(state.busFollowingMonster!.health == 1) {
          state.copyWith();
        }
      }
     } else if (movementDirection == BusMovementDirection.backwards) {
      state.copyWith(yPosition: state.yPosition - 1);
    } else if (movementDirection == BusMovementDirection.left) {
      state.copyWith(yPosition: state.xPosition - 1);
    } else if (movementDirection == BusMovementDirection.right) {
      state.copyWith(yPosition: state.xPosition + 1);
    }
  }

  void getNewEvent() {
    state.copyWith(currentEvent: BusGameEvent.values[rng.nextInt(BusGameEvent.values.length)]);
  }

  void getNewMap() {
    if (state.currentEvent == BusGameEvent.nothing) {
      getNewEvent();
    }
    if (state.currentEvent == BusGameEvent.busFollowingMonster) {}

    if (state.currentEvent == BusGameEvent.straightRoad) {
      state.copyWith(gameMap: {
        1: [
          MapTileType.forest,
          MapTileType.dirt,
          MapTileType.road,
          MapTileType.road,
          MapTileType.dirt,
          MapTileType.forest,
        ],
        2: [
          MapTileType.forest,
          MapTileType.dirt,
          MapTileType.road,
          MapTileType.road,
          MapTileType.dirt,
          MapTileType.forest,
        ],
        3: [
          MapTileType.forest,
          MapTileType.dirt,
          MapTileType.road,
          MapTileType.road,
          MapTileType.dirt,
          MapTileType.forest,
        ],
      });
    } else if (state.onRegularRoadTile1) {
      state.copyWith(gameMap: HorrorBusState.startingMap1);
    } else {
      state.copyWith(gameMap: HorrorBusState.startingMap2);
    }
  }
}

enum BusMovementDirection {
  forward,
  backwards,
  left,
  right;
}
