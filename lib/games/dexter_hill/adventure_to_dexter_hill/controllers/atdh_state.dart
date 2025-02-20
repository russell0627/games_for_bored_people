import '../../../../data/atdh_locations.dart';
import '../dungeon_challenge.dart';


class ATDhState {
  final Location currentLocation;
  final Player player;
  final bool isChestOpen;
  final int junglePlayerPosition;

  ATDhState({
    this.junglePlayerPosition = 0,
    this.isChestOpen = false,
    required this.player,
    this.currentLocation = Location.mainGraveyard,
  });

  ATDhState copyWith({
    Location? currentLocation,
    Player? player,
    bool? isChestOpen,
  }) {
    return ATDhState(
      currentLocation: currentLocation ?? this.currentLocation,
      player: player ?? this.player,
      isChestOpen: isChestOpen ?? this.isChestOpen,
    );
  }

  ChallengeType get challengeType => player.challengeType;
}

class Player {
  final int goldCount;

  final List<Item> inventory;

  bool checkForItem(Item itemType) => inventory.contains(itemType);

  Player({
    this.inventory = const [],
    this.goldCount = 0,
  });

  ChallengeType get challengeType {
    if (checkForItem(Item.sword)) {
      return ChallengeType.sword;
    } else if (checkForItem(Item.crossbow)) {
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

enum Item {
  horse,
  sword,
  grapplingHook,
  crossbow,
  bettaNote,
  chickenNote,
  hermitCrabNote;
}
