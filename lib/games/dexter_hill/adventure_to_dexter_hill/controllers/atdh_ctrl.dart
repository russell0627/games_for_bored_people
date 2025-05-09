import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/atdh_locations.dart';
import 'atdh_state.dart';

part 'atdh_ctrl.g.dart';

@riverpod
class ATDhController extends _$ATDhController {
  @override
  ATDhState build() {
    return ATDhState(player: Player());
  }

  void move(Direction direction) {
    state = state.copyWith(
      currentLocation: switch (direction) {
        Direction.north => state.currentLocation.north,
        Direction.south => state.currentLocation.south,
        Direction.east => state.currentLocation.east,
        Direction.west => state.currentLocation.west,
      },
    );
  }

  void moveTo(Location newLocation) {
    state = state.copyWith(currentLocation: newLocation);
  }

  void addItem(Item item) {
    state = state.copyWith(
      player: state.player.copyWith(
        inventory: state.player.inventory + [item],
      ),
    );
  }

  void openChest() {
    state = state.copyWith(isChestOpen: true);
  }

  bool hasItem (Item item) => state.player.inventory.contains(item);
}
