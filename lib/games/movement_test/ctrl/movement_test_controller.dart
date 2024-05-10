import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/atdh_locations.dart';
import '../models/collision_object.dart';
import 'movement_test_state.dart';

part 'movement_test_controller.g.dart';

@riverpod
class MovementTestController extends _$MovementTestController {
  MovementTestState build() => MovementTestState(collisionObjects: [
        CollisionObject(
            minY: 10, maxY: 20, minX: 10, maxX: 20, imagePath: "assets/movement_test/movement_test_wall.png")
      ]);

  void moveCharacter(Direction direction) {
    switch (direction) {
      case Direction.north:
        checkCollisions(newY: state.yPos - 1, useY: true) ? state.copyWith(yPos: state.yPos + 1) : null;
        break;
      case Direction.south:
        checkCollisions(newY: state.yPos - 1, useY: true) ? state.copyWith(yPos: state.yPos + 1) : null;
        break;

      case Direction.east:
        checkCollisions(newY: state.yPos - 1, useY: true) ? state.copyWith(yPos: state.yPos + 1) : null;
        break;

      case Direction.west:
        checkCollisions(newY: state.yPos - 1, useY: true) ? state.copyWith(yPos: state.yPos + 1) : null;
        break;
    }
  }

  bool checkCollisions({required int newY, int? newX, required bool useY}) {
    if (useY) {
      for (CollisionObject collision in state.collisionObjects) {
        if (newY >= collision.minY && newY <= collision.maxY) {
          return false;
        } else {
          return true;
        }
      }
    } else {
      for (CollisionObject collision in state.collisionObjects) {
        if (newX! >= collision.minX && newX <= collision.maxX) {
          return false;
        } else {
          return true;
        }
      }
    }
    return true;
  }
}
