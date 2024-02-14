import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/atdh_ctrl.dart';
import 'controllers/atdh_state.dart';
import 'treasure_room.dart';

class DungeonChallengePage extends ConsumerWidget {
  const DungeonChallengePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(aTDhControllerProvider);

    return Center(
      child: switch (state.challengeType) {
        ChallengeType.sword => const SwordChallenge(),
        ChallengeType.crossbow => const CrossbowChallenge(),
        ChallengeType.grapplingHook => const GrapplingHookChallenge(),
      },
    );
  }
}

class SwordChallenge extends ConsumerWidget {
  static String imagePath = "assets/dexter_hill/images/sword_challenge_background.png";

  const SwordChallenge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagePath))),
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                imagePath = "assets/dexter_hill/images/sword_challenge_completed_background.png";
              },
              child: const Text("Attack Monster")),
          if (imagePath == "assets/dexter_hill/images/sword_challenge_completed_background.png")
            TextButton(onPressed: () {
              ref.read(aTDhControllerProvider).copyWith(
                currentLocation: Location.treasureRoom
              );
            }, child: const Text("Go To Treasure Room"))
        ],
      ),
    );
  }
}

class CrossbowChallenge extends StatelessWidget {
  static String imagePath = "assets/dexter_hill/images/target_challenge_background.png";

  const CrossbowChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(imagePath),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TreasureRoom()));
                  },
                  child: const Text("Shoot Green Target")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Shoot red Target")),
            ],
          ),
        ),
      ],
    );
  }
}

class GrapplingHookChallenge extends StatelessWidget {
  const GrapplingHookChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/dexter_hill/images/grapple_hook_challenge_background.png")),
      ),
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TreasureRoom()));
              },
              child: const Text("Scale Cliff"))
        ],
      ),
    );
  }
}

enum ChallengeType {
  sword,
  crossbow,
  grapplingHook;
}
