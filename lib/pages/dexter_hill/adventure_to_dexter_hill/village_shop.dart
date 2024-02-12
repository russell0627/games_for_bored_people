import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dungeon_challenge.dart';
import 'player_ctrl.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop"),
      ),
      body: Center(
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
                  if (state.hasHorse == true) {
                    state.copyWith(daysUntilHillFound: state.daysUntilHillFound - 1);
                  } else {
                    state.copyWith(daysUntilHillFound: state.daysUntilHillFound - 2);
                  }
                  showDialog(context: context, builder: (_) => const NewItemDialog());
                },
                child: const Text("Continue to Next Area"))
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
    final state = ref.read(playerControllerProvider);

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
                state.copyWith(hasGrapplingHook: true, hasCrossbow: false, hasSword: false);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DungeonChallengePage(ChallengeType.grapplingHook)));
              },
              child: const Text("Take Grappling Hook")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              onPressed: () {
                state.copyWith(hasSword: true, hasGrapplingHook: false, hasCrossbow: false);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DungeonChallengePage(ChallengeType.sword)));
              },
              child: const Text("Take Sword")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              onPressed: () {
                state.copyWith(hasCrossbow: true);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DungeonChallengePage(ChallengeType.crossbow)));
              },
              child: const Text("Take Crossbow")),
        ),
      ],
    );
  }
}
