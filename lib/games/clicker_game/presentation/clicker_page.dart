import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../clicker_ctrl.dart';
import '../models/income_source.dart';

class ClickerPage extends ConsumerWidget {
  const ClickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clickerCtrlProvider);
    final ctrl = ref.read(clickerCtrlProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(state.balance.toString()),
            const Text("Click Me!"),
            TextButton(onPressed: () => ctrl.click(), child: Image.asset("assets/clicker_game/clicker_dino.png")),
            Text("Clicks Until Income: ${state.clicksUntilIncome}"),
            Text("Total Income: ${state.totalIncome.toString()}"),
            const Text("Income Sources"),
            if (state.incomeSources.isNotEmpty)
              Expanded(
                child: ListView(
                  children: [
                    for (IncomeSource source in state.incomeSources.values)
                      ListTile(
                        title: Text(source.name.name.titleCase),
                        subtitle: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Income: ${source.singularIncome * source.qty} Qty: ${source.qty}"),
                            ),
                            if (source.name == IncomeSourceTitle.dinosaurEgg && source.qty != 0)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Clicks Until Hatched: ${source.clicksUntil}"),
                              ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 200,
                          child: Row(
                            children: [
                              if (source.name != IncomeSourceTitle.iguanodon &&
                                  source.name != IncomeSourceTitle.parasaurolophus)
                                TextButton(
                                    onPressed: () {
                                      if (source.name == IncomeSourceTitle.dinosaurEgg && source.qty == state.maxEggs) {
                                        return;
                                      }
                                      if (source.name == IncomeSourceTitle.dinosaurEgg) {
                                        ctrl.resetClicksUntil(source.name);
                                      }
                                      if (state.balance >= source.cost) {
                                        ctrl.buyIncomeSource(source);
                                      }
                                    },
                                    child: Text("Buy 1: ${source.cost}")),
                            ],
                          ),
                        ),
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
