import 'package:flutter/material.dart';

final Widget graveyardGroundImage = Image.asset("assets/dexter_hill/new_graveyard_ground.png");
const String gravestoneImagePath = "assets/dexter_hill/images/new_graveyard_ground_with_gravestone.png";
const String noteToDexter = """For me, many pets have come and gone. 
Dexter, was one of the best. 
He was with us for so many years, almost my entire life as of writing this. 
But alas, all good things must come to an end. I got to be there from some of his early years through to his final day. 
I loved him. He was a great dog. 
I will always remember him as my grandpa's best bud.

And when it is Oscar's time to go, I will put him up on the hill with Dexter, so they can be together, once more.

- Russell""";
const String berryBettaFishText =
    "Berry was my first Betta fish. It died tragically from unknown causes. Berry and I were just starting to bond when they died.";
const String hermitCrabsText =
    "None of my hermit crabs that died had names except for the small one, his name was Tiny Tim. I do not know the cause of his death. He was also the first hermit crab I ever had. I miss him a lot.";

bool bettaNotePieceFound = false;

class DexterHillPage extends StatelessWidget {
  const DexterHillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dexter Hill"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/dexter_hill/images/dexter_hill_with_note.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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

class MainGraveyardPage extends StatelessWidget {
  const MainGraveyardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Graveyard"),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  graveyardGroundImage,
                  FunctionalImage(
                      onTapped: () => showDialog(
                          context: context,
                          builder: (_) => const GravestoneDetailsDialog(gravestoneText: berryBettaFishText)),
                      imagePath: gravestoneImagePath),
                  graveyardGroundImage,
                  FunctionalImage(
                      onTapped: () => showDialog(
                          context: context,
                          builder: (_) => const GravestoneDetailsDialog(gravestoneText: hermitCrabsText)),
                      imagePath: gravestoneImagePath),
                  graveyardGroundImage,
                ],
              ),
              Row(
                children: [
                  graveyardGroundImage,
                  graveyardGroundImage,
                  graveyardGroundImage,
                  graveyardGroundImage,
                  graveyardGroundImage,
                ],
              ),
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DexterHillPage())),
                  child: const Text("Visit Dexter Hill"))
            ],
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
        if (gravestoneText == berryBettaFishText)
          TextButton(onPressed: () => bettaNotePieceFound = true, child: const Text("Collect Note Piece"))
      ],
    );
  }
}
