import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

final AudioPlayer cabinExteriorAudioPlayer = AudioPlayer();
final AudioPlayer cabinInteriorAudioPlayer = AudioPlayer();
final AudioPlayer cabinInteriorFireSoundsAudioPlayer = AudioPlayer();

class DexterHillCabinPage extends StatelessWidget {
  const DexterHillCabinPage({super.key});

  @override
  Widget build(BuildContext context) {
    cabinExteriorAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/dexter_hill_cabin_exterior_music.mp3"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cabin"),
        leading: IconButton(onPressed: () {
          cabinExteriorAudioPlayer.stop();
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/dexter_hill/images/dexter_hill_cabin_exterior.png"))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {
                cabinExteriorAudioPlayer.stop();
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DexterHillCabinInteriorPage()));
              }, child: const Text("Go inside"))
            ],
          ),
        ),
      ),
    );
  }
}

class DexterHillCabinInteriorPage extends StatelessWidget {
  const DexterHillCabinInteriorPage({super.key});

  @override
  Widget build(BuildContext context) {
    cabinInteriorAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/dexter_hill_cabin_music.mp3"));
    cabinInteriorFireSoundsAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/dexter_hill_fire_crackling.wav"));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          cabinInteriorAudioPlayer.stop();
          cabinInteriorFireSoundsAudioPlayer.stop();
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back)),
        title: const Text("Cabin Interior"),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
                image: AssetImage("assets/dexter_hill/images/dexter_hill_cabin_interior.png"))
          ),
        ),
      ),
    );
  }
}
