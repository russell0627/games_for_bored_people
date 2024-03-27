import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/atdh_ctrl.dart';
import 'controllers/atdh_state.dart';

class TreasureRoom extends ConsumerWidget {
  static const openChestImagePath = "assets/dexter_hill/images/open_chest_image.png";
  static const closedChestImagePath = "assets/dexter_hill/images/closed_chest_image.png";

  const TreasureRoom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl =ref.read(aTDhControllerProvider.notifier);
    final state =ref.watch(aTDhControllerProvider);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(state.isChestOpen ? openChestImagePath : closedChestImagePath),
          ),
        ),
        child: Column(
          children: [
            if (!state.isChestOpen)
              TextButton(
                  onPressed: () {
                    state.copyWith(isChestOpen: true);
                  },
                  child: const Text("Open Chest")),
            TextButton(onPressed: () {
              ctrl.move(Direction.north);
            }, child: const Text("Continue to Dexter Hill")),
          ],
        ),
      ),
    );
  }
}
