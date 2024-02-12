import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'player_state.dart';

part 'player_ctrl.g.dart';

@riverpod
class PlayerController extends _$PlayerController {
  PlayerState build() {
    return PlayerState(goldCount: 0, hasHorse: false, daysUntilHillFound: 10, hasGrapplingHook: false, hasCrossbow: false, hasSword: false);
  }

  void buyHorse() {
    if (state.goldCount >= 25) {
      state.copyWith(
        goldCount: state.goldCount - 25,
        hasHorse: true,
      );
    }
  }
}
