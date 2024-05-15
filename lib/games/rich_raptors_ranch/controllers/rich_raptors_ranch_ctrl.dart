import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'rich_raptors_ranch_state.dart';

part 'rich_raptors_ranch_ctrl.g.dart';

@riverpod
class RichRaptorsRanchCtrl extends _$RichRaptorsRanchCtrl {
  RichRaptorsRanchState build() => RichRaptorsRanchState(
        money: 100,
        herbivoreFood: 10,
        carnivoreFood: 0,
      );
}
