import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
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
            Text("Money: ${state.balance}  Dino Food: ${state.dinoFood}"),
            if (state.incomeSources[IncomeSourceTitle.iguanodon]!.qty +
                    state.incomeSources[IncomeSourceTitle.parasaurolophus]!.qty +
                    state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.qty <
                state.dinoFood)
              TextButton(
                  onPressed: () => SmartDialog.show(builder: (_) => const SellFoodDialog(), clickMaskDismiss: false),
                  child: const Text("Sell Dino Food")),
            TextButton(
                onPressed: () => SmartDialog.show(builder: (_) => const CheatsMenu()),
                child: const Text("Cheats Menu!")),
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
                                  source.name != IncomeSourceTitle.parasaurolophus && source.name != IncomeSourceTitle.tyrannosaurusRex)
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

class SellFoodDialog extends ConsumerWidget {
  const SellFoodDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clickerCtrlProvider);
    final ctrl = ref.watch(clickerCtrlProvider.notifier);
    final int extraDinoFood = state.dinoFood -
        state.incomeSources[IncomeSourceTitle.iguanodon]!.qty +
        state.incomeSources[IncomeSourceTitle.tyrannosaurusRex]!.qty +
        state.incomeSources[IncomeSourceTitle.parasaurolophus]!.qty +
        state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.qty;

    return SimpleDialog(
      title: const Text("Do you want to sell your excess food?"),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have $extraDinoFood extra dino food"),
          ],
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  ctrl.addBalance(extraDinoFood * 5);
                  ctrl.removeDinoFood(extraDinoFood);
                  SmartDialog.dismiss();
                },
                child: Text("Sell Extra Food: ${extraDinoFood * 5}")),
            TextButton(
                onPressed: () {
                  SmartDialog.dismiss();
                },
                child: const Text("Keep Extra Food.")),
          ],
        )
      ],
    );
  }
}

class CheatsMenu extends ConsumerWidget {
  const CheatsMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.watch(clickerCtrlProvider.notifier);

    return SimpleDialog(
      children: [
        ...const [
          DebugButtonData(value: 50, label: "Add 50 Money"),
          DebugButtonData(value: 100, label: "Add 100 Money"),
        ].map(
          (data) => TextButton(
            onPressed: () => ctrl.addBalance(data.value),
            child: Text(data.label),
          ),
        ),
        ...const [
          DebugButtonData(value: 50, label: "Add 50 Dino Food"),
          DebugButtonData(value: 100, label: "Add 100 Dino Food"),
        ].map(
          (data) => TextButton(
            onPressed: () => ctrl.addDinoFood(data.value),
            child: Text(data.label),
          ),
        ),
      ],
    );
  }
}

class DebugButtonData {
  final int value;
  final String label;

  const DebugButtonData({
    required this.value,
    required this.label,
  });
}
