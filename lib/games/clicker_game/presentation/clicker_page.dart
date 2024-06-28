import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../clicker_ctrl.dart';
import '../clicker_state.dart';
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
            ListView(
              children: [
                for (IncomeSource source in state.incomeSources)
                  ListTile(
                    title: Text(source.name),
                    subtitle: Text("Income Per Second: ${source.singularIncomePerSecond.toString()}"),
                    trailing: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              final newSet = state.incomeSources..remove(source);
                              newSet.add(source.copyWith(qty: source.qty + 1));
                              state.copyWith(incomeSources: newSet);
                            },
                            child: const Text("Buy 1")),
                        TextButton(
                            onPressed: () {
                              final newSet = state.incomeSources..remove(source);
                              newSet.add(source.copyWith(qty: source.qty + 10));
                              state.copyWith(incomeSources: newSet);
                            },
                            child: const Text("Buy 10")),
                        TextButton(
                            onPressed: () {
                              final newSet = state.incomeSources..remove(source);
                              newSet.add(source.copyWith(qty: source.qty + 100));
                              state.copyWith(incomeSources: newSet);
                            },
                            child: const Text("Buy 100")),
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
