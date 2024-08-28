import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/roller.dart';
import 'controller/alien_killer_ctrl.dart';
import 'controller/alien_killer_state.dart';

class CircleTest extends ConsumerWidget {
  static const alienWidth = 84.0;
  static const alienHeight = 84.0;

  const CircleTest({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final state = ref.watch(alienKillerCtrlProvider);
    final ctrl = ref.read(alienKillerCtrlProvider.notifier);

    final size = MediaQuery.of(context).size;
    final maxX = (size.width - alienWidth).toInt();
    final maxY = (size.height - (size.height * 0.22265625) - alienHeight).toInt();
    // print("SIZE: $size");
    // print("maxX: $maxX");
    // print("maxY: $maxY");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Extraterrestrial Extermination!",
          style: TextStyle(
            inherit: false,
            fontFamily: "Nebulous",
          ),
        ),
      ),
      body: Container(
        height: 768,
        width: 768,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(state.score < 50
                    ? "assets/extraterrestrial_extermination/alien_game_background.png"
                    : state.score < 100
                        ? "assets/extraterrestrial_extermination/alien_game_background_2.png"
                        : state.score < 150
                            ? "assets/extraterrestrial_extermination/alien_game_background_3.png"
                            : "assets/extraterrestrial_extermination/alien_game_background_4.png"))),
        child: Column(
          children: [
            Text(
              "Score: ${state.score}",
              style: const TextStyle(fontFamily: "Nebulous"),
            ),
            Expanded(
              child: Stack(
                children: [
                  for (int i = 0; i < state.alienNumbers[VehicleSide.front]!; i++)
                    Positioned(
                      left: rand(maxX).toDouble(),
                      top: rand(maxY).toDouble(),
                      child: GestureDetector(
                          onTap: () {
                            final spawnCount = rand(4) + 1;

                            if (state.alienNumbers[VehicleSide.front]! - 1 == 0) {
                              for (int i = 0; i < spawnCount; i++) {
                                ctrl.addAlienToSide(VehicleSide.front);
                              }
                            }
                            ctrl.killAlien(VehicleSide.front);
                          },
                          child: Image.asset(rollDie(2) == 1
                              ? "assets/extraterrestrial_extermination/alien_game_enemy.png"
                              : "assets/extraterrestrial_extermination/alien_game_enemy_2.png")),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
