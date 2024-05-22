import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/roller.dart';
import '../models/player.dart';
import 'ten_thousand_state.dart';

part 'ten_thousand_ctrl.g.dart';

@riverpod
class TenThousandCtrl extends _$TenThousandCtrl {
  TenThousandState build() => TenThousandState(currentPlayerIndex: 0, players: []);

  void ttRoll(
    int numberOfDice,
  ) {
    List<TTPlayer> newPlayers = state.players;
    RollResult rollResult = roll(numberOfDice, 6, 0);

    newPlayers.replaceRange(state.currentPlayerIndex, state.currentPlayerIndex, [
      TTPlayer(
          name: state.players[state.currentPlayerIndex].name,
          dice: rollResult.rolls,
          score: state.players[state.currentPlayerIndex].score)
    ]);

    state = state.copyWith(players: newPlayers);
  }

  void ttScore(
    List<int> selectedDice,
  ) {
    int pointsGained = 0;
    int ones = 0;
    int twos = 0;
    int threes = 0;
    int fours = 0;
    int fives = 0;
    int sixes = 0;
    bool fullHousePt1Found = false;
    bool fullHousePt2Found = false;
    List<int> dice = selectedDice;
    dice.sort();
    //Check for straight
    if (selectedDice.length == 6) {
      if (selectedDice == [1, 2, 3, 4, 5, 6]) {
        pointsGained += 1500;
      }
    }
    //Sort numbers
    while(selectedDice.contains(1)) {
      ones++;
      selectedDice.remove(1);
    }
    while(selectedDice.contains(2)) {
      twos++;
      selectedDice.remove(2);
    }
    while(selectedDice.contains(3)) {
      threes++;
      selectedDice.remove(3);
    }
    while(selectedDice.contains(4)) {
      fours++;
      selectedDice.remove(4);
    }
    while(selectedDice.contains(5)) {
      fives++;
      selectedDice.remove(5);
    }
    while(selectedDice.contains(6)) {
      sixes++;
      selectedDice.remove(6);
    }
    if (ones == 3 || twos == 3 || threes == 3 || fours == 3 || fives == 3 || sixes == 3) {
      fullHousePt1Found = true;
    }
    if ( ones == 2 || twos == 2 || threes == 2 || fours == 2 || fives == 2 || sixes == 2) {
      fullHousePt2Found = true;
    }
    if (fullHousePt1Found && fullHousePt2Found) {
      pointsGained += 1500;
    }
  }
}
