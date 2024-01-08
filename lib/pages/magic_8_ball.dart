import 'dart:math';

import 'package:flutter/material.dart';

class Magic8BallPage extends StatelessWidget {
  const Magic8BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Magic 8 Ball"),),
      body: const Center(child: Column(children: [Ball()],),),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = Random(DateTime.now().millisecondsSinceEpoch).nextInt(6) + 1;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(child: Image(image: AssetImage("assets/magic_8_ball/images/ball$ballNumber.png"),), onPressed: () {
        setState(() {
          ballNumber = Random(DateTime.now().millisecondsSinceEpoch).nextInt(5) + 1;
        });
      },),
    );
  }
}
