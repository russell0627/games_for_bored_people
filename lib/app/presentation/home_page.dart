import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../games/1v1_race/presentation/sprite_test_page.dart';
import '../../games/alphabet_game/alphabet_game_page.dart';

// import '../../games/rl/top_down_game/top_down_game.dart';
import '../../games/rich_raptors_ranch/presentation/rrr_home_page.dart';
import '../../pages/magic_8_ball.dart';
import '../../settings_dialog.dart';
import '../../widgets/collectable_dialog.dart';
import '../routes.dart';

//TODO: Add the game 10,000 to the app under the dice games

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () => showDialog(context: context, builder: (_) => const SettingsDialog()),
              icon: const Icon(Icons.settings)),
        ],
        title: const Text('Games for Bored People', style: TextStyle(fontFamily: "Merienda", inherit: false)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TextButton(
              //   child: const Text("Dice Games"),
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DiceGamesPage()));
              //   },
              // ),
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
              // TextButton(
              //   child: const Text("Puzzle Game"),
              //   onPressed: () {
              //     context.goNamed(AppRoute.puzzle.name);
              //   },
              // ),
              TextButton(
                child: const Text("Brick Breaker"),
                onPressed: () {
                  context.goNamed(AppRoute.brickBreaker.name);
                },
              ),
              TextButton(
                child: const Text("Quizzez"),
                onPressed: () {
                  context.goNamed(AppRoute.quizzez.name);
                },
              ),
              TextButton(
                child: const Text("Extraterrestrial Extermination"),
                onPressed: () {
                  context.goNamed(AppRoute.alienKiller.name);
                },
              ),
              // TextButton(
              //   child: const Text("Extraterrestrial Extermination"),
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (_) => TopDownGame()));
              //   },
              // ),
              TextButton(
                child: const Text("RRR Test"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const RRRHomePage()));
                },
              ),
              TextButton(
                child: const Text("Sprite Test"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SpriteTestPage()));
                },
              ),
              TextButton(
                onPressed: () => context.goNamed(AppRoute.collectables.name),
                child: const Text("Collectables"),
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
                          child: Image.asset("assets/dexter_hill/images/gravestone_icon.png"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
