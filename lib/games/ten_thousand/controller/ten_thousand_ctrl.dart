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

  int ttScore(
    List<int> selectedDice,
  ) {
    int pointsGained = 0;
    int ones = 0;
    int twos = 0;
    int threes = 0;
    int fours = 0;
    int fives = 0;
    int sixes = 0;
    bool onesScored = false;
    bool fivesScored = false;
    bool fullHousePt1Found = false;
    bool fullHousePt2Found = false;
    int? firstPair;
    int? secondPair;
    int? thirdPair;
    List<int> dice = selectedDice;
    dice.sort();
    //Check for straight
    if (selectedDice.length == 6) {
      if (selectedDice == [1, 2, 3, 4, 5, 6]) {
        pointsGained += 1500;
      }
    }
    //Sort numbers
    while (selectedDice.contains(1)) {
      ones++;
      selectedDice.remove(1);
    }
    while (selectedDice.contains(2)) {
      twos++;
      selectedDice.remove(2);
    }
    while (selectedDice.contains(3)) {
      threes++;
      selectedDice.remove(3);
    }
    while (selectedDice.contains(4)) {
      fours++;
      selectedDice.remove(4);
    }
    while (selectedDice.contains(5)) {
      fives++;
      selectedDice.remove(5);
    }
    while (selectedDice.contains(6)) {
      sixes++;
      selectedDice.remove(6);
    }
    //Check for full house
    if (ones == 3 || twos == 3 || threes == 3 || fours == 3 || fives == 3 || sixes == 3) {
      fullHousePt1Found = true;
    }
    if (ones == 2 || twos == 2 || threes == 2 || fours == 2 || fives == 2 || sixes == 2) {
      fullHousePt2Found = true;
    }
    if (fullHousePt1Found && fullHousePt2Found) {
      pointsGained += 1500;
    }
    //Check for 3 pairs
    if (ones == 2) {
      firstPair = 1;
    } else if (twos == 2) {
      firstPair = 2;
    } else if (threes == 2) {
      firstPair = 3;
    } else if (fours == 2) {
      firstPair = 4;
    } else if (fives == 2) {
      firstPair = 5;
    } else if (sixes == 2) {
      firstPair = 6;
    }
    if (ones == 2) {
      if (firstPair != 1) {
        secondPair = 1;
      }
      secondPair = 1;
    } else if (twos == 2) {
      if (firstPair != 2) {
        secondPair = 2;
      }
      secondPair = 1;
    } else if (threes == 2) {
      if (firstPair != 3) {
        secondPair = 3;
      }
    } else if (fours == 2) {
      if (firstPair != 4) {
        secondPair = 4;
      }
    } else if (fives == 2) {
      if (firstPair != 5) {
        secondPair = 5;
      }
      secondPair = 1;
    } else if (sixes == 2) {
      if (firstPair != 6) {
        secondPair = 6;
      }
    }
    if (ones == 2) {
      if (secondPair != 1) {
        thirdPair = 1;
      }
    } else if (twos == 2) {
      if (secondPair != 2) {
        thirdPair = 2;
      }
      secondPair = 1;
    } else if (threes == 2) {
      if (secondPair != 3) {
        thirdPair = 3;
      }
    } else if (fours == 2) {
      if (secondPair != 4) {
        thirdPair = 4;
      }
    } else if (fives == 2) {
      if (secondPair != 5) {
        thirdPair = 5;
      }
      secondPair = 1;
    } else if (sixes == 2) {
      if (secondPair != 6) {
        thirdPair = 6;
      }
    }
    if (firstPair != null && secondPair != null && thirdPair != null) {
      pointsGained += 1000;
    }
    if (firstPair == 1 || secondPair == 1 || thirdPair == 1) {
      onesScored = true;
    }
    if (firstPair == 5 || secondPair == 5 || thirdPair == 5) {
      fivesScored = true;
    }
    if (!onesScored) {
      if (ones >= 3) {
        if (ones == 3) {
          pointsGained += 1000;
        } else if (ones == 4) {
          pointsGained += 2000;
        } else if (ones == 5) {
          pointsGained += 4000;
        } else if (ones == 6) {
          pointsGained += 8000;
        }
      }
    }
    if (twos >= 3) {
      if (twos == 3) {
        pointsGained += 100;
      } else if (twos == 4) {
        pointsGained += 200;
      } else if (twos == 5) {
        pointsGained += 400;
      } else if (twos == 6) {
        pointsGained += 800;
      }
      if (twos >= 3) {
        if (twos == 3) {
          pointsGained += 100;
        } else if (twos == 4) {
          pointsGained += 200;
        } else if (twos == 5) {
          pointsGained += 400;
        } else if (twos == 6) {
          pointsGained += 800;
        }
        if (threes >= 3) {
          if (threes == 3) {
            pointsGained += 100;
          } else if (threes == 4) {
            pointsGained += 200;
          } else if (threes == 5) {
            pointsGained += 400;
          } else if (threes == 6) {
            pointsGained += 800;
          }
          if (fours >= 3) {
            if (fours == 3) {
              pointsGained += 100;
            } else if (fours == 4) {
              pointsGained += 200;
            } else if (fours == 5) {
              pointsGained += 400;
            } else if (fours == 6) {
              pointsGained += 800;
            }
            if (!fivesScored) {
              if (fives >= 3) {
                if (fives == 3) {
                  pointsGained += 100;
                } else if (fives == 4) {
                  pointsGained += 200;
                } else if (fives == 5) {
                  pointsGained += 400;
                } else if (fives == 6) {
                  pointsGained += 800;
                }
              }
              if (sixes >= 3) {
                if (sixes == 3) {
                  pointsGained += 100;
                } else if (sixes == 4) {
                  pointsGained += 200;
                } else if (sixes == 5) {
                  pointsGained += 400;
                } else if (sixes == 6) {
                  pointsGained += 800;
                }
              }
              if (!onesScored) {
                if (ones >= 1) {
                  pointsGained += 100 * ones;
                }
                if (!fivesScored) {
                  if (fives >= 1) {
                    pointsGained += 50 * fives;
                  }
                }
              }
            }
          }
        }
      }
    }
    return pointsGained;
  }
  List<int> generateDiceList(List<int> selectedDice) {
    final List<int> newList = [];
    for(int i = 0; i < selectedDice.length; i++) {
      newList.add(state.players[state.currentPlayerIndex].dice[i]);
    }
    return newList;
  }
}
