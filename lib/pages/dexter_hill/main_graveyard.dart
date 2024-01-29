import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dexter_hill.dart';

const double squareHeight = 250;
const double squareWidth = squareHeight;

final Widget graveyardGroundImage = Image.asset("assets/dexter_hill/images/new_graveyard_ground.png");
final Widget gravestonePart2Image = Image.asset("assets/dexter_hill/images/gravestone_pt2.png");
const String gravestoneImagePath = "assets/dexter_hill/images/new_graveyard_ground_with_gravestone.png";
const String gravestoneImagePath2 = "assets/dexter_hill/images/gravestone_2.png";
const String gravestoneImagePath3 = "assets/dexter_hill/images/gravestone_3.png";
final AudioPlayer mainGraveyardAudioPlayer = AudioPlayer();
final AudioPlayer mainGraveyardPaperCrinkleAudioPlayer = AudioPlayer();
final AudioPlayer mainGraveyardFootstepsAudioPlayer = AudioPlayer();

const String berryBettaFishText =
    "Berry was my first Betta fish. It died tragically from unknown causes. Berry and I were just starting to bond when they died.";
const String hermitCrabsText =
    "None of my hermit crabs that died had names except for the small one, his name was Tiny Tim. I do not know the cause of his death. He was also the first hermit crab I ever had. I miss him a lot.";
const chickensText =
    "My Grandmother has had many chickens, most of them have died. The one I remember most was named Fluffy. He was a copper color, a color similar to my hair. I called him Fluffy because he had a lot of feathers that make him look like he had fluffy fur. We had a couple chicks that we took care of, one of which was Fluffy. I miss him.";

bool bettaNotePieceFound = false;
bool hermitCrabNotePieceFound = false;
bool chickensNotePieceFound = false;

class MainGraveyardPage extends StatefulWidget {
  const MainGraveyardPage({super.key});

  @override
  State<MainGraveyardPage> createState() => _MainGraveyardPageState();
}

class _MainGraveyardPageState extends State<MainGraveyardPage> {
  @override
  Widget build(BuildContext context) {
    mainGraveyardAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/main_graveyard_music.mp3"));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Graveyard"),
          leading: IconButton(
              onPressed: () {
                mainGraveyardAudioPlayer.stop();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  chickensNotePieceFound = false;
                  bettaNotePieceFound = false;
                  hermitCrabNotePieceFound = false;
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                      SizedBox(
                        height: squareHeight,
                        width: squareWidth,
                        child: FunctionalImage(
                            onTapped: () => showDialog(
                                context: context,
                                builder: (_) => const GravestoneDetailsDialog(gravestoneText: berryBettaFishText)),
                            imagePath: gravestoneImagePath),
                      ),
                      SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                      SizedBox(
                        height: squareHeight,
                        width: squareWidth,
                        child: FunctionalImage(
                            onTapped: () => showDialog(
                                context: context,
                                builder: (_) => const GravestoneDetailsDialog(gravestoneText: hermitCrabsText)),
                            imagePath: gravestoneImagePath2),
                      ),
                      SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                      SizedBox(
                        height: squareHeight,
                        width: squareWidth,
                        child: FunctionalImage(
                            onTapped: () => showDialog(
                                context: context,
                                builder: (_) => const GravestoneDetailsDialog(gravestoneText: chickensText)),
                            imagePath: gravestoneImagePath3),
                      ),
                      SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                      SizedBox(height: squareHeight, width: squareWidth, child: gravestonePart2Image),
                      SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                      SizedBox(height: squareHeight, width: squareWidth, child: gravestonePart2Image),
                      SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                      SizedBox(height: squareHeight, width: squareWidth, child: gravestonePart2Image),
                      SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        if (bettaNotePieceFound == true &&
                            hermitCrabNotePieceFound == true &&
                            chickensNotePieceFound == true) {
                          mainGraveyardAudioPlayer.stop();
                          mainGraveyardFootstepsAudioPlayer
                              .play(DeviceFileSource("assets/dexter_hill/audio/transition_to_dexter_hill.mp3"));
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DexterHillPage()));
                        } else {
                          showDialog(context: context, builder: (_) => const MissingNotePieceDialog());
                        }
                      },
                      child: const Text("Visit Dexter Hill"))
                ],
              ),
            ),
          ),
        ));
  }
}

class FunctionalImage extends StatelessWidget {
  final void Function() onTapped;
  final String imagePath;

  const FunctionalImage({super.key, required this.onTapped, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Image.asset(imagePath),
    );
  }
}

class GravestoneDetailsDialog extends StatelessWidget {
  final String gravestoneText;

  const GravestoneDetailsDialog({super.key, required this.gravestoneText});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(gravestoneText),
        ),
        gravestoneTextChecker(gravestoneText)
      ],
    );
  }
}

Widget gravestoneTextChecker(String gravestoneText) {
  if (gravestoneText == berryBettaFishText) {
    return TextButton(
        onPressed: () {
          mainGraveyardPaperCrinkleAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/note_picked_up.wav"));
          bettaNotePieceFound = true;
        },
        child: const Text("Collect Note Piece"));
  } else if (gravestoneText == hermitCrabsText) {
    return TextButton(
        onPressed: () {
          mainGraveyardPaperCrinkleAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/note_2_picked_up.wav"));
          hermitCrabNotePieceFound = true;
        },
        child: const Text("Collect Note Piece"));
  } else {
    return TextButton(
        onPressed: () {
          mainGraveyardPaperCrinkleAudioPlayer.play(DeviceFileSource("assets/dexter_hill/audio/note_3_picked_up.wav"));
          chickensNotePieceFound = true;
        },
        child: const Text("Collect Note Piece"));
  }
}

class MissingNotePieceDialog extends StatelessWidget {
  const MissingNotePieceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("You have not found all of the note pieces. Try again when you have found them all!"),
        )
      ],
    );
  }
}

