import 'horror_bus_ctrl.dart';

class HorrorBusState {
  static const Map<int, List<MapTileType>> startingMap1 = {
    1: [
      MapTileType.forest,
      MapTileType.road,
      MapTileType.road,
      MapTileType.dirt,
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
      MapTileType.dirt,
      MapTileType.road,
      MapTileType.road,
      MapTileType.forest,
    ],
  };
  static const Map<int, List<MapTileType>> startingMap2 = {
    1: [
      MapTileType.forest,
      MapTileType.dirt,
      MapTileType.dirt,
      MapTileType.road,
      MapTileType.road,
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
      MapTileType.road,
      MapTileType.road,
      MapTileType.dirt,
      MapTileType.dirt,
      MapTileType.forest,
    ],
  };
  final BusFollowingMonster? busFollowingMonster;
  final OtherCar? otherCar;
  final int health;
  final List<Student> students;
  final int xPosition;
  final int yPosition;
  final int movementPoints;
  final BusGameEvent currentEvent;
  final Map<int, List<MapTileType>> gameMap;
  final bool onRegularRoadTile1;

  HorrorBusState({
    this.busFollowingMonster, this.otherCar,
    this.onRegularRoadTile1 = true,
    this.gameMap = const {},
    this.health = 3,
    this.students = const [],
    this.xPosition = 0,
    this.yPosition = 0,
    this.movementPoints = 0,
    this.currentEvent = BusGameEvent.nothing,
  });

  HorrorBusState copyWith({
    BusFollowingMonster? busFollowingMonster,
    OtherCar? otherCar,
    int? health,
    List<Student>? students,
    int? xPosition,
    int? yPosition,
    int? movementPoints,
    BusGameEvent? currentEvent,
    Map<int, List<MapTileType>>? gameMap,
    bool? onRegularRoadTile1,
  }) {
    return HorrorBusState(
      busFollowingMonster: busFollowingMonster ?? this.busFollowingMonster,
      otherCar: otherCar ?? this.otherCar,
      health: health ?? this.health,
      students: students ?? this.students,
      xPosition: xPosition ?? this.xPosition,
      yPosition: yPosition ?? this.yPosition,
      movementPoints: movementPoints ?? this.movementPoints,
      currentEvent: currentEvent ?? this.currentEvent,
      gameMap: gameMap ?? this.gameMap,
      onRegularRoadTile1: onRegularRoadTile1 ?? this.onRegularRoadTile1,
    );
  }
}

class Student {
  final int busStation;

  Student({required this.busStation});
}

class Enemy {
  final int xPosition;
  final int yPosition;
  final int health;

  Enemy({
    required this.xPosition,
    required this.yPosition,
    required this.health,
  });
}

class BusFollowingMonster extends Enemy {
  final BusMovementDirection currentRequiredBusMove;

  BusFollowingMonster(
      {
      this.currentRequiredBusMove = BusMovementDirection.forward,
      required super.xPosition,
      required super.yPosition,
      super.health = 1});

  BusFollowingMonster copyWith({
    int? xPosition,
    int? yPosition,
    BusMovementDirection? currentRequiredBusMove,
  }) {
    return BusFollowingMonster(
      currentRequiredBusMove: currentRequiredBusMove ?? this.currentRequiredBusMove,
      xPosition: xPosition ?? this.xPosition,
      yPosition: yPosition ?? this.yPosition,
    );
  }
}

class OtherCar {}

enum BusGameEvent {
  nothing,
  busFollowingMonster,
  otherCar,
  personInRoad,
  straightRoad,
}

enum MapTileType {
  road,
  dirt,
  forest;
}
