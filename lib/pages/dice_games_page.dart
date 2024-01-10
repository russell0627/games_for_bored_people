import 'package:flutter/material.dart';

import '../games/20_rollers.dart';

class DiceGamesPage extends StatefulWidget {
  const DiceGamesPage({super.key});

  @override
  State<DiceGamesPage> createState() => _DiceGamesPageState();
}

class _DiceGamesPageState extends State<DiceGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Games"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DieTypeSelectionPage())), child: const Text("20 Rollers"),)
          ],
        ),
      ),
    );
  }
}
