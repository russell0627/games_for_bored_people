import 'package:flutter/material.dart';

class RRRHomePage extends StatelessWidget {
  const RRRHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                DragTarget(builder: (_, values, dynams) => Icon(Icons.abc)),
                DragTarget(builder: (_, values, dynams) => Icon(Icons.abc)),
                DragTarget(builder: (_, values, dynams) => Icon(Icons.abc)),
              ],
            ),
            Spacer(),
            Draggable(feedback: const Placeholder(), child: Image.asset("assets/quizzez/images/dinosaurs/aardonyx.png"))
          ],
        ),
      ),
    );
  }
}
