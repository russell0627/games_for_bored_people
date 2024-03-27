import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'controllers/atdh_ctrl.dart';
import 'controllers/atdh_state.dart';
import 'controllers/player_ctrl.dart';
import 'presentation/adventure_to_dexter_hill_page.dart';

class JungleToDexterHill extends ConsumerStatefulWidget {
  const JungleToDexterHill({super.key});

  @override
  ConsumerState<JungleToDexterHill> createState() => _MazeToDexterHillState();
}

class _MazeToDexterHillState extends ConsumerState<JungleToDexterHill> {
  final List<Direction> correctMapDirections = [
    Direction.north,
    Direction.east,
    Direction.north,
    Direction.east,
    Direction.north,
    Direction.north,
    Direction.west,
    Direction.north,
  ];

  static int mapIndex = 0;
  static int timesReset = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/dexter_hill/images/jungle_background.png")),
        ),
        child: Column(
          children: [
            TextButton(onPressed: () => SmartDialog.show(builder: (_) => const InstructionsDialog(instructionText: "Use the buttons to input the directions shown on the map. If an incorrect direction is entered the puzzle will restart.", location: Location.jungleEntrance)), child: const Text("Instructions")),
            TextButton(
                onPressed: () => showDialog(context: context, builder: (_) => const MapDialog()),
                child: const Text("View Map")),
            TextButton(
                onPressed: () {
                  if (correctMapDirections[mapIndex] == Direction.north) {
                    mapIndex++;
                    checkMapCompletion();
                  } else {
                    mapIndex = 0;
                    timesReset++;
                    SmartDialog.show(builder: (_) => const IncorrectDirectionDialog());
                  }
                },
                child: const Text("Go North")),
            TextButton(
                onPressed: () {
                  if (correctMapDirections[mapIndex] == Direction.south) {
                    mapIndex++;
                    checkMapCompletion();
                  } else {
                    mapIndex = 0;
                    timesReset++;
                    SmartDialog.show(builder: (_) => const IncorrectDirectionDialog());
                  }
                },
                child: const Text("Go South")),
            TextButton(
                onPressed: () {
                  if (correctMapDirections[mapIndex] == Direction.east) {
                    mapIndex++;
                    checkMapCompletion();
                  } else {
                    mapIndex = 0;
                    timesReset++;
                    SmartDialog.show(builder: (_) => const IncorrectDirectionDialog());
                  }
                },
                child: const Text("Go East")),
            TextButton(
                onPressed: () {
                  if (correctMapDirections[mapIndex] == Direction.west) {
                    mapIndex++;
                    checkMapCompletion();
                  } else {
                    mapIndex = 0;
                    timesReset++;
                    SmartDialog.show(builder: (_) => const IncorrectDirectionDialog());
                  }
                },
                child: const Text("Go West")),
          ],
        ),
      ),
    );
  }

  void checkMapCompletion() {
    if (timesReset == 9) {
      showDialog(context: context, builder: (_) => const GameFailedDialog());
      Navigator.of(context).pop();
    } else {
      if (mapIndex == correctMapDirections.length) {
        ref.read(playerControllerProvider).copyWith(daysUntilHillFound: 10 - timesReset + 1);
        correctMapDirections.removeRange(0, correctMapDirections.last.index);
        SmartDialog.show(builder: (_) => const MapCompletedDialog());
      }
    }
  }
}

class JungleExit extends ConsumerWidget {
  const JungleExit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/dexter_hill/images/jungle_background.png")),
      ),
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                ref.watch(aTDhControllerProvider.notifier).move(Direction.north);
              },
              child: const Text("North")),
        ],
      ),
    );
  }
}

class MapCompletedDialog extends ConsumerWidget {
  const MapCompletedDialog({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final ctrl = ref.watch(aTDhControllerProvider.notifier);

    return SimpleDialog(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("You escaped the jungle! You also found 50 gold."),
        ),
        TextButton(
            onPressed: () {
              ctrl.moveTo(Location.storyPage4);
              SmartDialog.dismiss();
            },
            child: const Text("Continue"))
      ],
    );
  }
}

class GameFailedDialog extends StatelessWidget {
  const GameFailedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("You Failed. You were lost in the jungle and you starved to death."),
        )
      ],
    );
  }
}

class MapDialog extends StatelessWidget {
  const MapDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              "After reading the map you figure out that you need to go: North, East, North, East, North, North, West, North."),
        )
      ],
    );
  }
}

class IncorrectDirectionDialog extends StatelessWidget {
  const IncorrectDirectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              "You went the wrong way and ended up back where you started. You will need to navigate through the jungle again."),
        )
      ],
    );
  }
}
