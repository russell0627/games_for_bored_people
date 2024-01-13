import 'package:flutter/material.dart';

import '../../../utils/roller.dart';

// final List<TwentyRollersCard> deck = [];
// final List<TwentyRollersCard> player1Hand = [];
// final List<TwentyRollersCard> player2Hand = [];
CurrentDie currentDie = CurrentDie.d20;

class DieTypeSelectionPage extends StatelessWidget {
  const DieTypeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Die Type"),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton(
              items: const [
                DropdownMenuItem(child: Text("d6")),
                DropdownMenuItem(child: Text("d8")),
                DropdownMenuItem(child: Text("d12")),
                DropdownMenuItem(child: Text("d20")),
              ],
              onChanged: (newValue) {
                if (newValue == "d6") {
                  currentDie = CurrentDie.d6;
                }
                if (newValue == "d8") {
                  currentDie = CurrentDie.d8;
                }
                if (newValue == "d12") {
                  currentDie = CurrentDie.d12;
                }
                if (newValue == "d20") {
                  currentDie = CurrentDie.d20;
                }
              },
            ),
            TextButton(
                onPressed: () =>
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TwentyRollersGame())),
                child: const Text("Play!"))
          ],
        ),
      ),
    );
  }
}


class TwentyRollersGame extends StatefulWidget {
  const TwentyRollersGame({super.key});

  @override
  State<TwentyRollersGame> createState() => _TwentyRollersGameState();
}

class _TwentyRollersGameState extends State<TwentyRollersGame> {
  @override
  void initState() {
    generateDeck();
    player1Roll = 0;
    player2Roll = 0;
    player1Score = 0;
    player2Score = 0;
    super.initState();
  }

  WinType winType = WinType.tie;
  int player1Score = 0;
  int player1Roll = 0;
  int player2Score = 0;
  int player2Roll = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("20 Rollers!"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(player1Score.toString()),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("P1"),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("P2"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(player2Score.toString()),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  rollGameDice();
                  showDialog(context: context, builder: (_) => const UseItemsDialog(playerNumber: 1));
                  showDialog(context: context, builder: (_) => const UseItemsDialog(playerNumber: 2));
                  checkScore();
                },
                child: const Text("Roll"))
          ],
        ),
      ),
    );
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

  void generateDeck() {
    // for (int i = 0; i > 15; i++) {
    //   deck.add(TwentyRollersCard(cardName: "+1 Card", cardEffect: CardEffect.plus1));
    // }
    // for (int i = 0; i > 15; i++) {
    //   deck.add(TwentyRollersCard(cardName: "-1 Card", cardEffect: CardEffect.minus1));
    // }
    // for (int i = 0; i > 10; i++) {
    //   deck.add(TwentyRollersCard(cardName: "+2 Card", cardEffect: CardEffect.plus2));
    // }
    // for (int i = 0; i > 10; i++) {
    //   deck.add(TwentyRollersCard(cardName: "-2 Card", cardEffect: CardEffect.minus2));
    // }
    // for (int i = 0; i > 5; i++) {
    //   deck.add(TwentyRollersCard(cardName: "Switch Numbers Card", cardEffect: CardEffect.switchNumbers));
    // }
    // deck.shuffle();
  }
}

class PlayerWinDialog extends StatelessWidget {
  final WinType winType;

  const PlayerWinDialog({super.key, required this.winType});

  String getText() {
    if (winType == WinType.p1Win) {
      return "P1 Wins!";
    }
    if (winType == WinType.p2Win) {
      return "P2 Wins!";
    }
    if (winType == WinType.tie) {
      return "It's A Tie!";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(getText()),
    );
  }
}

class UseItemsDialog extends StatelessWidget {
  final int playerNumber;

  const UseItemsDialog({super.key, required this.playerNumber});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("P$playerNumber: Do You Use An Item?"),
      children: [ListView()],
    );
  }
}

enum CardEffect {
  plus1,
  minus1,
  plus2,
  minus2,
  switchNumbers;
}


enum WinType {
  p1Win,
  p2Win,
  tie;
}


enum CurrentDie {
  d6,
  d8,
  d12,
  d20;
}

Map<CurrentDie, int> dieSidesMap = {
  CurrentDie.d6: 6,
  CurrentDie.d8: 8,
  CurrentDie.d12: 12,
  CurrentDie.d20: 20,
};
