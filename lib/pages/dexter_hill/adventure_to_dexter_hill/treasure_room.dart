import 'package:flutter/material.dart';

import '../dexter_hill.dart';

class TreasureRoomPage extends StatelessWidget {
  static String imagePath = "assets/dexter_hill/images/closed_chest_image.png";

  const TreasureRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Treasure Room"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagePath))),
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    imagePath = "assets/dexter_hill/images/open_chest_image.png";
                    build(context);
                  },
                  child: const Text("Open Chest")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DexterHillPage()));
                  },
                  child: const Text("Continue to Dexter Hill"))
            ],
          ),
        ),
      ),
    );
  }
}
