import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

const String noteToDexter = """For me, many pets have come and gone. 
Dexter, was one of the best. 
He was with us for so many years, almost my entire life as of writing this. 
But alas, all good things must come to an end. I got to be there from some of his early years through to his final day. 
I loved him. He was a great dog. 
I will always remember him as my grandpa's best bud.

And when it is Oscar's time to go, I will put him up on the hill with Dexter, so they can be together, once more.

- Russell""";

final AudioPlayer dexterHillAudioPlayer = AudioPlayer();

class DexterHillPage extends StatelessWidget {
  const DexterHillPage({super.key});

  @override
  Widget build(BuildContext context) {
    dexterHillAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/new_dexter_hill_music.mp3"));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              dexterHillAudioPlayer.stop();
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Dexter Hill"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage("assets/dexter_hill/images/bigger_dexter_hill_with_note.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => const DexterHillImageDialog(
                            imagePath: "assets/dexter_hill/images/dexter_images/dexter_image_1.jpg"));
                  },
                  child: const Text("See Image 1")),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => const DexterHillImageDialog(
                            imagePath: "assets/dexter_hill/images/dexter_images/dexter_image_2.JPG"));
                  },
                  child: const Text("See Image 2")),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => const DexterHillImageDialog(
                            imagePath: "assets/dexter_hill/images/dexter_images/dexter_image_3.JPG"));
                  },
                  child: const Text("See Image 3")),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => const DexterHillImageDialog(
                            imagePath: "assets/dexter_hill/images/dexter_images/dexter_image_4.jpg"));
                  },
                  child: const Text("See Image 4")),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                    onPressed: () => showDialog(context: context, builder: (_) => const DexterHillNoteDialog()),
                    child: const Text("Read Note")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DexterHillNoteDialog extends StatelessWidget {
  const DexterHillNoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(noteToDexter),
        ),
      ],
    );
  }
}

class DexterHillImageDialog extends StatelessWidget {
  final String imagePath;

  const DexterHillImageDialog({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SizedBox(height: 400, width: 400, child: Image.asset(imagePath)),
      ],
    );
  }
}
