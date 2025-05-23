import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../games/alphabet_game/alphabet_game_page.dart';

import '../../games/clicker_game/presentation/clicker_page.dart';
import '../../games/light_switch/light_switch_page.dart';
import '../../games/race/pages/race_page.dart';
import '../../settings_dialog.dart';
import '../routes.dart';

//TODO: Add dinosaur view page where a list of dinosaurs and their diet, order, and time period can be viewed.

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
              TextButton(
                child: const Text("Light Switch"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LightSwitchPage(title: "Light Switch!")));
                },
              ),
              TextButton(
                child: const Text("Clicker Game"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ClickerPage()));
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
             TextButton(
                child: const Text("Frog Racing"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RacePage()));
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
