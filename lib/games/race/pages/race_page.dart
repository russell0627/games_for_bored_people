import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../controllers/race_controller.dart';
import '../widgets/win_dialog.dart';

class RacePage extends ConsumerWidget {
  const RacePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(raceControllerProvider);
    final ctrl = ref.read(raceControllerProvider.notifier);

    ref.listen(raceControllerProvider, (prev, next) {
      if (next.winFound != 0) {
        SmartDialog.show(
          builder: (_) => RaceWinDialog(frog: next.winFound),

        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Race!"),
      ),
      body: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Frog 1: ${state.raceLane1.progress}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Frog 2: ${state.raceLane2.progress}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Frog 3: ${state.raceLane3.progress}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Frog 4: ${state.raceLane4.progress}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Frog 5: ${state.raceLane5.progress}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Frog 6: ${state.raceLane6.progress}"),
                ],
              ),
            ),
            TextButton(onPressed: () => ctrl.progressRace(), child: const Text("Roll"))
          ],
        ),
      ),
    );
  }
}
