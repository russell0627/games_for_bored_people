import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../games/dexter_hill/adventure_to_dexter_hill/presentation/adventure_to_dexter_hill_page.dart';
import '../../games/puzzle_game/presentation/puzzle_page.dart';
import '../../pages/alphabet_game_page.dart';
import '../../pages/dice_games_page.dart';
import '../../pages/magic_8_ball.dart';
import '../../pages/movie_theater_page.dart';
import '../../settings_dialog.dart';
import '../routes.dart';

//TODO: Add the game 10,000 to the app under the dice games

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [IconButton(onPressed: () => showDialog(context: context, builder: (_) => const SettingsDialog()), icon: const Icon(Icons.settings))],
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
                  context.goNamed(AppRoute.ttt.name);
                },
              ),
              TextButton(
                child: const Text("Puzzle Game"),
                onPressed: () {
                  context.goNamed(AppRoute.puzzle.name);
                 },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () => context.goNamed(AppRoute.aTDH.name),
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