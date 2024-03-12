import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/atdh_ctrl.dart';
import 'controllers/atdh_state.dart';

class FieldPage extends ConsumerWidget {
  final bool isField2;
  
  const FieldPage({super.key, required this.isField2});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(aTDhControllerProvider.notifier);
    final state = ref.watch(aTDhControllerProvider);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(!isField2? "assets/dexter_hill/images/new_graveyard_ground.png" : "assets/dexter_hill/images/field_with_dungeon_entrance.png"))
      ),
      
      child: Column(
        children: [
          if(!isField2)
            TextButton(onPressed: () {
              state.copyWith(currentLocation: Location.field);
              controller.move(Direction.north);
            }, child: const Text("North")),
          // if(isField2)
          //   TextButton(onPressed: () {
          //     state.copyWith(currentLocation: Location.field2);
          //     controller.move(Direction.north);
          //   }, child: const Text("Enter Dungeon"))
        ],
      ),
    );
  }
}
