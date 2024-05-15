import 'package:flutter/material.dart';
import 'package:sprite/sprite.dart';

import '../../../utils/screen_utils.dart';

class SpriteTestPage extends StatelessWidget {
  const SpriteTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sprite Test!"),
      ),
      body: const Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 60 * 2,
                  width: 60 * 2,
                  child: Sprite(
                    size: Size(15, 16),
                    amount: 2,
                    imagePath: "assets/race/robot_spritesheet.png",
                  ),
                ),
                boxM,
                SizedBox(
                  height: 36 * 2,
                  width: 58 * 2,
                  child: Sprite(size: Size(18, 12), amount: 2, imagePath: "assets/race/robot_idle_spritesheet.png",),
                )
              ],
            ),
            boxM,
            SizedBox(
              height: 60,
              width: 60,
              child: Sprite(
                size: Size(10, 16),
                amount: 2,
                imagePath: "assets/race/knight_spritesheet.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
