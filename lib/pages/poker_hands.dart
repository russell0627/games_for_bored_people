import 'package:flutter/material.dart';

List<PokerCard> deck = [];
List<PokerHand> playerHands = [];

class PokerGame extends StatefulWidget {
  const PokerGame({super.key});

  @override
  State<PokerGame> createState() => _PokerGameState();
}

class _PokerGameState extends State<PokerGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poker"),
      ),
    );
  }
}

class PokerHandWidget extends StatelessWidget {
  final String playerName;

  const PokerHandWidget({super.key, required this.playerName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$playerName's Hand"),
        ),
        ListView(
          children: [],
        ),
      ],
    );
  }
}

List<Container> createHandWidgets(PokerHand hand) {
  List<Container> widgets = [];

  for (PokerCard value in hand.handContents) {
    widgets.add(
      Container(
        child: Text(value.toString()),
      ),
    );
  }
  return widgets;
}

class PokerHand {
  final String playerName;
  List<PokerCard> handContents = [];

  PokerHand({required this.playerName});
}

class PokerCard {
  final String cardType;
  final CardSymbol cardSymbol;

  PokerCard({required this.cardType, required this.cardSymbol});

  @override
  String toString() => "$cardType $cardSymbol";
}

enum CardSymbol {
  spades,
  clubs,
  hearts,
  diamonds;
}
