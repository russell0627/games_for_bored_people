import '../dungeon_challenge.dart';

class ATDhState {
  final Location currentLocation;
  final Player player;

  ATDhState({
    required this.player,
    this.currentLocation = Location.storyPage1,
  });

  ATDhState copyWith({
    Location? currentLocation,
    Player? player,
  }) {
    return ATDhState(
      currentLocation: currentLocation ?? this.currentLocation,
      player: player ?? this.player,
    );
  }

  ChallengeType get challengeType => player.challengeType;
}

enum Location {
  storyPage1(north: storyPage2),
  storyPage2(north: mainGraveyard),
  mainGraveyard(east: jungleEntrance),
  storyPage3(north: jungleEntrance),
  //Jungle Entrance north is just a placeholder for when the move function needs it to go to the Jungle Exit
  jungleEntrance(north: storyPage4),
  storyPage4(north: shop),
  shop(north: Location.field),
  field(north: storyPage5),

  storyPage5(north: dungeon),
  dungeon(north: Location.treasureRoom),
  treasureRoom(east: Location.dexterHill),
  storyPage6(north: storyPage8),
  storyPage7(north: storyPage8),
  storyPage8(north: dexterHill),
  cabin(),
  dexterHill(north: Location.cabin);

  final Location? north;
  final Location? south;
  final Location? east;
  final Location? west;

  const Location({this.north, this.south, this.east, this.west});
}

enum Direction {
  north,
  south,
  east,
  west;
}

class Player {
  final int goldCount;

  final List<Item> inventory;

  bool checkForItem(ItemType itemType) => inventory.contains(Item(itemType: itemType));

  Player({
    this.inventory = const [],
    this.goldCount = 0,
  });

  ChallengeType get challengeType {
    if (checkForItem(ItemType.sword)) {
      return ChallengeType.sword;
    } else if (checkForItem(ItemType.crossbow)) {
      return ChallengeType.crossbow;
    } else {
      return ChallengeType.grapplingHook;
    }
  }

  Player copyWith({
    int? goldCount,
    List<Item>? inventory,
  }) {
    return Player(
      inventory: inventory ?? this.inventory,
      goldCount: goldCount ?? this.goldCount,
    );
  }
}

class Item {
  final ItemType itemType;

  Item({required this.itemType});
}

enum ItemType {
  horse,
  sword,
  grapplingHook,
  crossbow;
}
