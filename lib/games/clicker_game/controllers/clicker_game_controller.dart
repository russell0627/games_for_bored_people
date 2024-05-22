import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'clicker_game_state.dart';

part 'clicker_game_controller.g.dart';

@riverpod
class ClickerGameCtrl extends _$ClickerGameCtrl {
  ClickerGameState build() => ClickerGameState(clickIncome: 1, otherIncome: 0);
}