import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../games/collectables/controller/collectables_ctrl.dart';
import '../games/collectables/data/collectables.dart';
import '../games/collectables/models/collectable.dart';
import '../utils/screen_utils.dart';

class CollectablePage extends StatelessWidget {
  const CollectablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(tabs: [Tab(text: "Main Collectables",), Tab(text: "Figure Parts",)]),
      ),
      body: TabBarView(children: [
        Column(
          children: [
            Row(
              children: [
                CollectableDisplay(collectable: collectables[CollectableName.fullDexter]!),
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                boxM,
                CollectableDisplay(collectable: collectables[CollectableName.dexter1]!),
                boxM,
                CollectableDisplay(collectable: collectables[CollectableName.dexter2]!),
                boxM,
                CollectableDisplay(collectable: collectables[CollectableName.dexter3]!),
                boxM,
                CollectableDisplay(collectable: collectables[CollectableName.dexter4]!),
                boxM,
              ],
            )
          ],
        ),

      ]),
    ),);
  }
}


class CollectableDisplay extends ConsumerWidget {
  final Collectable collectable;

  const CollectableDisplay({super.key, required this.collectable});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final state = ref.watch(collectablesCtrlProvider);

    return Container(
      height: 175,
      width: 175,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/collectables/cble_background.png"))),
      child: state.collectables.contains(collectable) || state.dexterCollectableParts.contains(collectable)
          ? Image.asset(collectable.imagePath)
          : Image.asset("assets/collectables/locked_cble.png"),
    );
  }
}