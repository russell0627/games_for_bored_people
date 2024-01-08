import 'package:flutter/material.dart';

double numberOfPlayers = 0;
final List<PokerCard> deck = [];
final List<PokerHand> playerHands = [];

class PokerGame extends StatefulWidget {
  const PokerGame({super.key});

  @override
  State<PokerGame> createState() => _PokerGameState();
}

class _PokerGameState extends State<PokerGame> {
  @override
  void initState() {
    for(int i = 0; i < numberOfPlayers; i++) {
      playerHands.add(PokerHand(playerName: "P${i + 1}"));
    }
    generateDeck(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poker"),
      ),
      body: Center(
        child: Column(
          children: [
            ListView(
              children: generatePlayerViewingWidgets(),
            )
          ],
        ),
      ),
    );
  }

  List<ListTile> generatePlayerViewingWidgets() {
    List<ListTile> widgets = [];

    for (PokerHand hand in playerHands) {
      widgets.add(ListTile(
        title: Text("${hand.playerName}'s hand"),
        trailing: TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => PokerHandPage(hand: hand))),
            child: const Text("View Hand")),
      ));
    }
    return widgets;
  }

  void generateDeck(bool startDeal) {
    for (String cardType in cardTypes) {
      deck.add(PokerCard(cardType: cardType, cardSymbol: CardSymbol.clubs));
    }
    for (String cardType in cardTypes) {
      deck.add(PokerCard(cardType: cardType, cardSymbol: CardSymbol.spades));
    }
    for (String cardType in cardTypes) {
      deck.add(PokerCard(cardType: cardType, cardSymbol: CardSymbol.hearts));
    }
    for (String cardType in cardTypes) {
      deck.add(PokerCard(cardType: cardType, cardSymbol: CardSymbol.diamonds));
    }
    deck.add(PokerCard(cardType: "Joker"));
    deck.add(PokerCard(cardType: "Joker"));

    if (startDeal) {
      dealCards();
    }
  }

  void dealCards() {
    for (PokerHand hand in playerHands) {
      for (int i = 0; i > 5; i++) {
        PokerCard currentCard = deck[0];
        deck.removeAt(0);
        hand.handContents.add(currentCard);
      }
    }
  }
}

class PokerHandPage extends StatefulWidget {
  final PokerHand hand;

  const PokerHandPage({super.key, required this.hand});

  @override
  State<PokerHandPage> createState() => _PokerHandPageState();
}

class _PokerHandPageState extends State<PokerHandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.hand.playerName}'s Hand"),
      ),
    );
  }
}

class PlayerCountPage extends StatefulWidget {
  const PlayerCountPage({super.key});

  @override
  State<PlayerCountPage> createState() => _PlayerCountPageState();
}

class _PlayerCountPageState extends State<PlayerCountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Player Count"),
      ),
      body: Center(
        child: Column(
          children: [
            Slider(
              value: numberOfPlayers,
              onChanged: (newValue) {
                setState(() {
                  numberOfPlayers = newValue;
                });
              },
              min: 2,
              max: 6,
            ),
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PokerGame())),
                child: const Text("Play!"))
          ],
        ),
      ),
    );
  }
}

class PokerHandWidget extends StatelessWidget {
  final PokerHand hand;

  const PokerHandWidget({super.key, required this.hand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${hand.playerName}'s Hand"),
        ),
        ListView(
          children: createHandWidgets(hand),
        ),
      ],
    );
  }
}

List<ListTile> createHandWidgets(PokerHand hand) {
  List<ListTile> widgets = [];

  for (PokerCard value in hand.handContents) {
    widgets.add(
      ListTile(
        title: Row(
          children: [Text(value.toString()), Image.asset("assets/poker/${value.cardType}")],
        ),
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
  final CardSymbol? cardSymbol;

  PokerCard({required this.cardType, this.cardSymbol});

  @override
  String toString() => cardType;
}

enum CardSymbol {
  spades,
  clubs,
  hearts,
  diamonds;

  @override
  String toString() => name;
}

List<String> cardTypes = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "J",
  "Q",
  "A",
];
