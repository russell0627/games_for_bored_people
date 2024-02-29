import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../cabin.dart';
import '../../dexter_hill.dart';
import '../../main_graveyard.dart';
import '../controllers/atdh_ctrl.dart';
import '../controllers/atdh_state.dart';
import '../dungeon_challenge.dart';
import '../field.dart';
import '../jungle_to_dexter_hill.dart';
import '../shop.dart';
import '../treasure_room.dart';

class AdventureToDexterHillPage extends ConsumerWidget {
  const AdventureToDexterHillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aTDhControllerProvider);
    final ctrl = ref.read(aTDhControllerProvider.notifier);

    print(state.currentLocation);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adventure To Dexter Hill"),
      ),
      body: switch(state.currentLocation) {
        Location.jungleEntrance => const JungleToDexterHill(),
        Location.mainGraveyard => const MainGraveyardPage(),
        Location.shop => const VillageShop(),
        Location.dungeon => const DungeonChallengePage(),
        Location.cabin => const DexterHillCabinPage(),
        Location.dexterHill => const DexterHillPage(),
        Location.treasureRoom => const TreasureRoom(),
        Location.jungleExit => const JungleExit(),
        Location.field => const FieldPage(isField2: false),
        Location.field2 => const FieldPage(isField2: true),
    },
    );
  }
}