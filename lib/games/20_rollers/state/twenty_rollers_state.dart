import 'package:flutter/material.dart';

import '../models/20_rollers_card.dart';

class TwentyRollersState extends StatefulWidget {
  const TwentyRollersState({super.key});

  @override
  State<TwentyRollersState> createState() => _TwentyRollersStateState();
}

class _TwentyRollersStateState extends State<TwentyRollersState> {
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

  final List<TwentyRollersCard> deck = [];
  final List<TwentyRollersCard> player1Hand = [];
  final List<TwentyRollersCard> player2Hand = [];
  CurrentDie currentDie = CurrentDie.d20;



  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void generateDeck() {
    for (int i = 0; i > 15; i++) {
      deck.add(TwentyRollersCard(cardName: "+1 Card", cardEffect: CardEffect.plus1));
    }
    for (int i = 0; i > 15; i++) {
      deck.add(TwentyRollersCard(cardName: "-1 Card", cardEffect: CardEffect.minus1));
    }
    for (int i = 0; i > 10; i++) {
      deck.add(TwentyRollersCard(cardName: "+2 Card", cardEffect: CardEffect.plus2));
    }
    for (int i = 0; i > 10; i++) {
      deck.add(TwentyRollersCard(cardName: "-2 Card", cardEffect: CardEffect.minus2));
    }
    for (int i = 0; i > 5; i++) {
      deck.add(TwentyRollersCard(cardName: "Switch Numbers Card", cardEffect: CardEffect.switchNumbers));
    }
    deck.shuffle();
  }


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

