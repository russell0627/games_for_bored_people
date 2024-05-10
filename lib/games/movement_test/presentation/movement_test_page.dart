import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joystick/joystick.dart';

import '../../../data/atdh_locations.dart';
import '../ctrl/movement_test_controller.dart';

class MovementTestPage extends ConsumerWidget {
  const MovementTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.read(movementTestControllerProvider.notifier);
    final state = ref.read(movementTestControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Movement Test!"),
      ),
      body: Center(
        child: Column(
          children: [
            Joystick(size: 75,
              isDraggable: true,
              joystickMode: JoystickModes.all,
              onUpPressed:() => ctrl.moveCharacter(Direction.north),
              onDownPressed:() => ctrl.moveCharacter(Direction.south),
              onLeftPressed:() => ctrl.moveCharacter(Direction.west),
              onRightPressed:() => ctrl.moveCharacter(Direction.east),
            ),
            Stack(
              children: [
                Positioned(child: Image.asset("assets/movement_test_wall.png"), left: 20,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
