import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/player_ctrl.dart';
import 'shop.dart';

class JungleToDexterHill extends ConsumerStatefulWidget {
  const JungleToDexterHill({super.key});

  @override
  ConsumerState<JungleToDexterHill> createState() => _MazeToDexterHillState();
}

class _MazeToDexterHillState extends ConsumerState<JungleToDexterHill> {
  final List<Direction> correctMapDirections = [
    Direction.north,
    Direction.north,
    Direction.east,
    Direction.south,
    Direction.west,
    Direction.east,
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
            TextButton(
                onPressed: () {
                  if (correctMapDirections[mapIndex] == Direction.north) {
                    mapIndex++;
                    checkMapCompletion();
                  } else {
                    mapIndex = 0;
                    timesReset++;
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
      if (mapIndex == correctMapDirections.length - 1) {
        ref.read(playerControllerProvider).copyWith(daysUntilHillFound: 10 - timesReset + 1);
        showDialog(context: context, builder: (_) => const MapCompletedDialog());
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VillageShop()));
      }
    }
  }
}

class MapCompletedDialog extends StatelessWidget {
  const MapCompletedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("You escaped the jungle! You also found 50 gold."),
        )
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

enum Direction {
  north,
  south,
  east,
  west;
}
