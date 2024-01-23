import 'package:flutter/material.dart';
import '../games/ttt/presentation/ttt_page.dart';
import 'alphabet_game_page.dart';
import 'dexter_hill/main_graveyard.dart';
import 'dice_games_page.dart';
import 'magic_8_ball.dart';
import 'movie_theater_page.dart';

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MainGraveyardPage())),
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("assets/dexter_hill/images/gravestone_icon.png"))),
                     TextButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MovieSelectionPage())),
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("assets/movie_theater/movie_theater_button.png"))),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
