import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../controllers/race_controller.dart';

class RaceWinDialog extends ConsumerWidget {
  final int frog;
  const RaceWinDialog({super.key, required this.frog});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(raceControllerProvider);
    final ctrl = ref.read(raceControllerProvider.notifier);


    return SimpleDialog(
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Frog $frog wins!"),
          ),
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
                TextButton(onPressed: () {
                  ctrl.reset();
                  SmartDialog.dismiss();
                }, child: Text("Close"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

