import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main_graveyard.dart';
import '../controllers/atdh_ctrl.dart';
import '../controllers/atdh_state.dart';
import '../dungeon_challenge.dart';
import '../jungle_to_dexter_hill.dart';
import '../shop.dart';

class AdventureToDexterHillPage extends ConsumerWidget {
  const AdventureToDexterHillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(aTDhControllerProvider);
    final ctrl = ref.read(aTDhControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adventure To Dexter Hill"),
      ),
      body: switch(state.currentLocation) {
        Location.jungleEntrance => const JungleToDexterHill(),
        Location.mainGraveyard => const MainGraveyardPage(),
        Location.shop => const VillageShop(),
        // TODO: Handle this case.
        Location.dungeon => const DungeonChallengePage(),
    },
    );
  }
}