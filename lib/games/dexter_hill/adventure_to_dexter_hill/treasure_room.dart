import 'package:flutter/material.dart';

import '../dexter_hill.dart';

class TreasureRoom extends StatefulWidget {
  const TreasureRoom({super.key});

  @override
  State<TreasureRoom> createState() => _TreasureRoomState();
}

class _TreasureRoomState extends State<TreasureRoom> {
  static const openChestImagePath = "assets/dexter_hill/images/open_chest_image.png";
  static const closedChestImagePath = "assets/dexter_hill/images/closed_chest_image.png";
  bool _isChestOpen = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_isChestOpen ? openChestImagePath : closedChestImagePath),
          ),
        ),
        child: Column(
          children: [
            if (!_isChestOpen)
              TextButton(
                  onPressed: () {
                    setState(() {
                      _isChestOpen = true;
                    });
                  },
                  child: const Text("Open Chest")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DexterHillPage()));
                },
                child: const Text("Continue to Dexter Hill")),
          ],
        ),
      ),
    );
  }
}
