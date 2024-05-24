import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dexter_hill/main_graveyard.dart';
import '../controller/ten_thousand_ctrl.dart';

class TenThousandPage extends ConsumerWidget {
  const TenThousandPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tenThousandCtrlProvider);
    final ctrl = ref.watch(tenThousandCtrlProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ten Thousand!"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(state.players[state.currentPlayerIndex].name),
            Row(
              children: [
                for (int i = 0; i < state.players[state.currentPlayerIndex].dice.length; i++)
          !state.diceRolled? Image.asset(
                      "assets/ten_thousand/ten_thousand_die_${state.players[state.currentPlayerIndex].dice[i]}.png") : FunctionalImage(onTapped: state.selectedDiceIndex.isEmpty? null: () => ctrl.ttScore(selectedDice), imagePath: "assets/ten_thousand/ten_thousand_die_${state.players[state.currentPlayerIndex].dice[i]}.png"),
                TextButton(
                    onPressed: () => ctrl.ttRoll(state.players[state.currentPlayerIndex].numberOfDice),
                    child: Row(
                      children: [
                        const Text("Roll!"),
                        Image.asset("assets/ten_thousand/ten_thousand_die_6.png"),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

