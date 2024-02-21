import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/atdh_ctrl.dart';
import 'controllers/atdh_state.dart';
import 'controllers/player_ctrl.dart';
import 'dungeon_challenge.dart';

class VillageShop extends ConsumerStatefulWidget {
  const VillageShop({super.key});

  @override
  ConsumerState<VillageShop> createState() => _VillageShopState();
}

class _VillageShopState extends ConsumerState<VillageShop> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final state = ref.watch(playerControllerProvider);
    final ctrl = ref.watch(playerControllerProvider.notifier);

    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/dexter_hill/images/shop_interior_background.png")),
        ),
        child: Column(
          children: [
            TextButton(
                onPressed: !state.hasHorse
                    ? () {
                        ctrl.buyHorse();
                      }
                    : null,
                child: const Text("Buy Horse and Saddle: 25gp")),
            const Spacer(),
            TextButton(
                onPressed: () {
                  showDialog(context: context, builder: (_) => const NewItemDialog());
                },
                child: const Text("North"))
          ],
        ),
      ),
    );
  }
}

class NewItemDialog extends ConsumerWidget {
  const NewItemDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.read(playerControllerProvider);
    final state = ref.read(aTDhControllerProvider);
    final controller = ref.read(aTDhControllerProvider.notifier);

    return SimpleDialog(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("You Get A New Item"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              onPressed: () {
                playerState.copyWith(hasGrapplingHook: true, hasCrossbow: false, hasSword: false);
                controller.move(Direction.north);
              },
              child: const Text("Take Grappling Hook")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              onPressed: () {
                playerState.copyWith(hasSword: true, hasGrapplingHook: false, hasCrossbow: false);
                controller.move(Direction.north);
              },
              child: const Text("Take Sword")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              onPressed: () {
                playerState.copyWith(hasCrossbow: true);
                controller.move(Direction.north);
              },
              child: const Text("Take Crossbow")),
        ),
      ],
    );
  }
}
