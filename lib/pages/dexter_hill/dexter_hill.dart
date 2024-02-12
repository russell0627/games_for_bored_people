import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cabin.dart';
import 'main_graveyard.dart';

const String noteToDexter = """For me, many pets have come and gone. 
Dexter, was one of the best. 
He was with us for so many years, almost my entire life as of writing this. 
But alas, all good things must come to an end. I got to be there from some of his early years through to his final day. 
I loved him. He was a great dog. It was always cute when he would lie down on the floor and it would look like he was melting into it.
I will always remember him as my grandpa's best bud.

And when it is Oscar's time to go, I will put him up on the hill with Dexter, so they can be together, once more.

- Russell""";
final AudioPlayer dexterHillAudioPlayer = AudioPlayer();
final AudioPlayer dexterHillNoteSoundAudioPlayer = AudioPlayer();
final AudioPlayer photoMusicAudioPlayer = AudioPlayer();

class DexterHillPage extends ConsumerWidget {
  const DexterHillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dexterHillAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/new_dexter_hill_music.mp3"));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              dexterHillAudioPlayer.stop();
              mainGraveyardAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/main_graveyard_music.mp3"));
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
              image: AssetImage("assets/dexter_hill/images/biggest_dexter_hill_with_note.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    dexterHillAudioPlayer.stop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DexterHillCabinPage()));
                  },
                  child: const Text("Go to Cabin")),
              TextButton(
                  onPressed: () {
                    dexterHillAudioPlayer.stop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const PictureManagerPage()),
                    );
                  },
                  child: const Text("Pictures Of Dexter")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      dexterHillNoteSoundAudioPlayer
                          .play(DeviceFileSource("assets/dexter_hill/audio/dexter_hill_note_used.wav"));
                      showDialog(
                          barrierDismissible: false, context: context, builder: (_) => const DexterHillNoteDialog());
                    },
                    child: const Text("Read Note")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DexterHillNoteDialog extends ConsumerWidget {
  const DexterHillNoteDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      dexterHillNoteSoundAudioPlayer.stop();
                      dexterHillNoteSoundAudioPlayer
                          .play(DeviceFileSource("assets/dexter_hill/audio/dexter_hill_note_put_down.mp3"));
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
              ],
            ),
            const Text('''A carving in the tree reads:
"Here Lies Dexter. He Was A Good Pup.". 
          
Above that there the top part of the note. You are able to reassemble the note from the pieces you found before coming here. The note says:'''),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(noteToDexter),
            ),
          ],
        ),
      ],
    );
  }
}

class DexterHillImageDialog extends ConsumerWidget {
  final String imagePath;

  const DexterHillImageDialog({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      children: [
        SizedBox(height: 400, width: 400, child: Image.asset(imagePath)),
      ],
    );
  }
}

class PictureManagerPage extends StatefulWidget {
  const PictureManagerPage({super.key});

  @override
  State<PictureManagerPage> createState() => _PictureManagerPageState();
}

class _PictureManagerPageState extends State<PictureManagerPage> {
  static List<Image> images = [];

  @override
  void initState() {
    super.initState();
    images = generateImageWidgets();
  }

  int pictureIndex = 0;

  @override
  Widget build(BuildContext context) {
    photoMusicAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/photos_music.mp3"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Album"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => () {
          photoMusicAudioPlayer.stop();
          dexterHillAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/new_dexter_hill_music.mp3"));
        },),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: 500,
                width: 750,
                child: images[pictureIndex]),
            const Spacer(),
            Row(
              children: [
                IconButton(
                    onPressed: pictureIndex != 0
                        ? () {
                            pictureIndex--;
                            setState(() {});
                          }
                        : null,
                    icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: pictureIndex != 37
                        ? () {
                            pictureIndex++;
                            setState(() {});
                          }
                        : null,
                    icon: const Icon(Icons.arrow_forward))
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Image> generateImageWidgets() {
    const numberOfLandscapeImages = 18;
    const numberOfPortraitImages = 17;

    const String landscapeImagePath = "assets/dexter_hill/images/dexter_images/landscape_pictures/landscape_pictures-";
    const String portraitImagePath = "assets/dexter_hill/images/dexter_images/portrait_pictures/portrait_pictures-";
    final List<Image> images = [];

    for (int i = 0; i < numberOfLandscapeImages; i++) {
      final String formattedNumber = i + 1 < 10 ? "0${i + 1}" : "${i + 1}";

      if (i + 1 != 7) {
        images.add(Image.asset("$landscapeImagePath$formattedNumber.png"));

      }

    }

    images.add(Image.asset("assets/dexter_hill/images/dexter_images/landscape_pictures/picture_of_dexter_2.png"));
    images.add(Image.asset("assets/dexter_hill/images/dexter_images/landscape_pictures/picture_of_dexter_3.png"));

    for (int i = 0; i < numberOfPortraitImages; i++) {
      final String formattedNumber = i + 1 < 10 ? "0${i + 1}" : "${i + 1}";

      images.add(Image.asset("$portraitImagePath$formattedNumber.png"));
    }

    images.add(Image.asset("assets/dexter_hill/images/dexter_images/portrait_pictures/picture_of_dexter_1.png"));
    images.add(Image.asset("assets/dexter_hill/images/dexter_images/portrait_pictures/picture_of_dexter_4.png"));


    return images;
  }

}
