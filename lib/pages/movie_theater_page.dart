import 'package:flutter/material.dart';

class MovieSelectionPage extends StatelessWidget {
  const MovieSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select A Movie"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () => const MovieTheaterPage(videoPath: "assets/movie_theater/monster_under_bed.gif"), child: const Text("Monster Under Bed"))
          ],
        ),
      ),
    );
  }
}


class MovieTheaterPage extends StatelessWidget {
  final String videoPath;
  
  const MovieTheaterPage({super.key, required this.videoPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Theater"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(videoPath)
          ],
        ),
      ),
    );
  }
}
