import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../horror_bus_ctrl.dart';
import '../../horror_bus_state.dart';

class GameMap extends ConsumerWidget {
  const GameMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref,) {
    final state = ref.watch(horrorBusCtrlProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                for(MapTileType tile in state.gameMap[1]!)
                  MapTile(mapTileType: tile, xPosition: 1, yPosition: 1)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MapTile extends ConsumerWidget {
  final MapTileType mapTileType;
  final int xPosition;
  final int yPosition;
  const MapTile({super.key, required this.mapTileType, required this.xPosition, required this.yPosition});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(horrorBusCtrlProvider);
    return Column(
      children: [
        Text(mapTileType.toString()),
        if(state.xPosition == xPosition && state.yPosition == yPosition)
          Text("Bus"),
      ],
    );
  }
}
