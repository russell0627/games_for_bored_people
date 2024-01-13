import 'package:flutter/material.dart';

import '../state/twenty_rollers_state.dart';

class TwentyRollersCtrl extends _$TwentyRollersCtrl {

}

void rollGameDice() {
  player1Roll = rollDie(dieSidesMap[currentDie]!);
  player2Roll = rollDie(dieSidesMap[currentDie]!);
}

WinType checkScore() {
  if (player1Roll > player2Roll) {
    return WinType.p1Win;
  } else if (player2Roll > player1Roll) {
    return WinType.p2Win;
  } else {
    return WinType.tie;
  }
}

void runWinLogic() {
  if (winType == WinType.p1Win) {}
}
