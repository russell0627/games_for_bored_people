import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
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
            const Text("Owned Income Sources"),
            if (state.incomeSources.isNotEmpty)
              ListView(
                children: [
                  for (IncomeSource source in state.incomeSources)
                    ListTile(
                      title: Text(source.name.name.titleCase),
                      subtitle: Text("Income Per Second: ${source.singularIncomePerSecond.toString()}"),
                      trailing: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                final newSet = state.incomeSources..remove(source);
                                newSet.add(source.copyWith(
                                  qty: source.qty + 1,
                                  cost: source.cost * 2,
                                ));
                                ctrl.removeBalance(source.cost);
                                ctrl.updateIncomeSources(newSet);
                              },
                              child: const Text("Buy 1")),
                          TextButton(
                              onPressed: () {
                                final newSet = state.incomeSources..remove(source);
                                newSet.add(source.copyWith(
                                  qty: source.qty + 10,
                                  cost: source.cost * 2,
                                ));
                                ctrl.removeBalance(source.cost * 10);

                                ctrl.updateIncomeSources(newSet);
                              },
                              child: const Text("Buy 10")),
                          TextButton(
                              onPressed: () {
                                final newSet = state.incomeSources..remove(source);
                                newSet.add(source.copyWith(
                                  qty: source.qty + 100,
                                  cost: source.cost * 2,
                                ));
                                ctrl.removeBalance(source.cost * 100);

                                ctrl.updateIncomeSources(newSet);
                              },
                              child: const Text("Buy 100")),
                        ],
                      ),
                    ),
                ],
              ),
            const Text("Unowned Income Sources"),
            if (state.incomeSources.isNotEmpty)
              ListView(
                children: [
                  for (IncomeSource source in state.incomeSources)
                    ListTile(
                      title: Text(source.name.name.titleCase),
                      subtitle: Text("Income Per Second: ${source.singularIncomePerSecond.toString()}"),
                      trailing: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                final newSet = state.incomeSources..remove(source);
                                newSet.add(source.copyWith(
                                  qty: source.qty + 1,
                                ));
                                ctrl.removeBalance(source.cost);
                                ctrl.updateIncomeSources(newSet);
                              },
                              child: const Text("Buy 1")),
                        ],
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
