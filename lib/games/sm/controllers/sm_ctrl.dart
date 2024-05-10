import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/roller.dart';
import 'sm_state.dart';

part 'sm_ctrl.g.dart';

@riverpod
class SmCtrl extends _$SmCtrl {
  SmState build() => SmState(score: 0);

  void spin() {
    state = state.copyWith(
      space1: rollDie(6),
      space2: rollDie(6),
      space3: rollDie(6),
    );
  }
  void score() {

  }
}
