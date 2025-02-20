import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/atdh_locations.dart';
import '../../data/gravestones.dart';
import '../../utils/popup_utils.dart';
import 'adventure_to_dexter_hill/controllers/atdh_ctrl.dart';
import 'adventure_to_dexter_hill/controllers/atdh_state.dart';

const double squareHeight = 250;
const double squareWidth = squareHeight;

final Widget graveyardGroundImage = Image.asset("assets/dexter_hill/images/new_graveyard_ground.png");
final Widget gravestonePart2Image = Image.asset("assets/dexter_hill/images/gravestone_pt2.png");
const String gravestoneImagePath = "assets/dexter_hill/images/new_graveyard_ground_with_gravestone.png";
const String gravestoneImagePath2 = "assets/dexter_hill/images/gravestone_2.png";
const String gravestoneImagePath3 = "assets/dexter_hill/images/gravestone_3.png";

// const String berryBettaFishText =
//     'Berry was my first Betta fish. It died tragically from unknown causes. Berry and I were just starting to bond when it died. I can still remember that on the day that he did die my sister Brienne said something horrible. She said something along the lines of "At least my fish is not dead." that just made that day a lot worse.';
// const String hermitCrabsText =
//     "None of my hermit crabs that died had names except for the small one, his name was Tiny Tim. I do not know the cause of his death. He was the first hermit crab I ever had. I miss him a lot.";
// const chickensText =
//     "My Grandmother has had many chickens, most of them have died. The one I remember most was named Fluffy. He was a copper color, a color similar to my hair. I called him Fluffy because he had a lot of feathers that make him look like he had fluffy fur. We had a couple chicks that we took care of, one of which was Fluffy. I miss him.";

// bool bettaNotePieceFound = false;
// bool hermitCrabNotePieceFound = false;
// bool chickensNotePieceFound = false;
bool dexterHillMapFound = false;

class MainGraveyardPage extends ConsumerStatefulWidget {
  const MainGraveyardPage({super.key});

  @override
  ConsumerState<MainGraveyardPage> createState() => _MainGraveyardPageState();
}

class _MainGraveyardPageState extends ConsumerState<MainGraveyardPage> {
  @override
  Widget build(BuildContext context) {
    final ctrl = ref.read(aTDhControllerProvider.notifier);

    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    ctrl.moveTo(Location.dexterHill);
                  },
                  child: const Text("Skip to Dexter Hill")),
              Row(
                children: [
                  SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                  SizedBox(
                    height: squareHeight,
                    width: squareWidth,
                    child: FunctionalImage(
                        onTapped: () => showDialog(
                            context: context,
                            builder: (_) => const GravestoneDetailsDialog(gravestone: Gravestone.betta)),
                        imagePath: gravestoneImagePath),
                  ),
                  SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                  SizedBox(
                    height: squareHeight,
                    width: squareWidth,
                    child: FunctionalImage(
                        onTapped: () => showDialog(
                            context: context,
                            builder: (_) => const GravestoneDetailsDialog(
                                  gravestone: Gravestone.hermitCrabs,
                                )),
                        imagePath: gravestoneImagePath2),
                  ),
                  SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                  SizedBox(
                    height: squareHeight,
                    width: squareWidth,
                    child: FunctionalImage(
                        onTapped: () {
                          showDialog(
                            context: context,
                            builder: (_) => const GravestoneDetailsDialog(gravestone: Gravestone.chickens),
                          );
                        },
                        imagePath: gravestoneImagePath3),
                  ),
                  SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                  SizedBox(height: squareHeight, width: squareWidth, child: gravestonePart2Image),
                  SizedBox(
                      height: squareHeight,
                      width: squareWidth,
                      child: FunctionalImage(
                        imagePath: "assets/dexter_hill/images/new_graveyard_ground_with_map.png",
                        onTapped: () {
                          dexterHillMapFound = true;
                        },
                      )),
                  SizedBox(height: squareHeight, width: squareWidth, child: gravestonePart2Image),
                  SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                  SizedBox(height: squareHeight, width: squareWidth, child: gravestonePart2Image),
                  SizedBox(height: squareHeight, width: squareWidth, child: graveyardGroundImage),
                ],
              ),
              TextButton(
                  onPressed: () {
                    if (ctrl.hasItem(Item.bettaNote) &&
                        ctrl.hasItem(Item.hermitCrabNote) &&
                        ctrl.hasItem(Item.chickenNote)) {
                      ctrl.moveTo(Location.dexterHill);
                    } else {
                      showDialog(context: context, builder: (_) => const MissingNotePieceDialog());
                    }
                  },
                  child: const Text("Follow Map"))
            ],
          ),
        ),
      ),
    );
  }
}

class FunctionalImage extends StatelessWidget {
  final void Function()? onTapped;
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

class GravestoneDetailsDialog extends ConsumerWidget {
  final Gravestone gravestone;

  const GravestoneDetailsDialog({super.key, required this.gravestone});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.read(aTDhControllerProvider.notifier);

    return SimpleDialog(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(gravestone.gravestoneText),
        ),
        switch (gravestone) {
          Gravestone.chickens => TextButton(
              onPressed: !ctrl.hasItem(Item.chickenNote)
                  ? () {
                      ctrl.addItem(Item.chickenNote);

                      showSuccessToast(
                          msg: "Note Piece added to inventory",
                          clickMaskDismiss: true,
                          displayTime: const Duration(seconds: 1));
                    }
                  : null,
              child: const Text("Collect Note Piece")),
          Gravestone.betta => TextButton(
              onPressed: !ctrl.hasItem(Item.bettaNote)
                  ? () {
                      ctrl.addItem(Item.bettaNote);

                      showSuccessToast(
                          msg: "Note Piece added to inventory",
                          clickMaskDismiss: true,
                          displayTime: const Duration(seconds: 1));
                    }
                  : null,
              child: const Text("Collect Note Piece")),
          Gravestone.hermitCrabs => TextButton(
              onPressed: !ctrl.hasItem(Item.hermitCrabNote)
                  ? () {
                      ctrl.addItem(Item.hermitCrabNote);
                      showSuccessToast(
                          msg: "Note Piece added to inventory",
                          clickMaskDismiss: true,
                          displayTime: const Duration(seconds: 1));
                    }
                  : null,
              child: const Text("Collect Note Piece")),
        },
      ],
    );
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
