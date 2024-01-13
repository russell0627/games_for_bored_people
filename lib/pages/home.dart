import 'package:flutter/material.dart';
import '../games/ttt/presentation/ttt_page.dart';
import 'alphabet_game_page.dart';
import 'dice_games_page.dart';
import 'magic_8_ball.dart';
import 'poker_hands.dart';

//TODO: Add the game 10,000 to the app under the dice games

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Games for Bored People'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                child: const Text("Dice Games"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DiceGamesPage()));
                },
              ),
              TextButton(
                child: const Text("Magic 8 Ball"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Magic8BallPage()));
                },
              ),
              TextButton(
                child: const Text("Alphabet Game"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AlphabetGamePage()));
                },
              ),
              TextButton(
                child: const Text("Tic-Tac-Toe"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TTTPage()));
                },
              ),
              // TextButton(
              //   child: const Text("Poker"),
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PokerGame()));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
