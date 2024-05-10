import '../models/collision_object.dart';

class MovementTestState {
  final int xPos;
  final int yPos;
  final List<CollisionObject> collisionObjects;

  MovementTestState({this.xPos = 0, this.yPos = 0, required this.collisionObjects, });

  MovementTestState copyWith({
    int? xPos,
    int? yPos,
  }) {
    return MovementTestState(
      xPos: xPos ?? this.xPos,
      yPos: yPos ?? this.yPos,
      collisionObjects: collisionObjects,
    );
  }

}