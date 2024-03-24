import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';
import 'cabin.dart';

const String noteToDexter = """For me, many pets have come and gone. 
Dexter, was one of the best. 
He was with us for so many years, almost my entire life as of writing this. 
But alas, all good things must come to an end. I got to be there from some of his early years through to his final day. 
I loved him. He was a great dog. It was always cute when he would lie down on the floor and it would look like he was melting into it.
I will always remember him as my grandpa's best bud.

And when it is Oscar's time to go, I will put him up on the hill with Dexter, so they can be together, once more.

- Russell, January 2024""";

const String endOfGameMessage = """This is it. You finished the game. I hope you liked it.
I have poured a lot of work into this project. That just shows how important Dexter was to me.
I never knew how much I really cared about him until I lost him. He was a great dog.
Making this has let me revisit so many great memories with Dexter.
It was crazy being able to see Dexter's entire life in just pictures. We have had so many great adventures
together. It was great to have him for so many years.
I still miss him a lot.

– Russell, Feb 29th 2024
""";

class DexterHillPage extends ConsumerWidget {
  const DexterHillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
              context.pop();
              context.pop();
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DexterHillCabinPage()));
                  },
                  child: const Text("Go to Cabin")),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PictureManagerPage()),
                  );
                },
                child: const Text("Pictures Of Dexter"),
              ),
              TextButton(
                onPressed: () {
                  SmartDialog.show(builder: (BuildContext context) => const EndOfGamePage());
                },
                child: const Text("End Game"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      showDialog(context: context, builder: (_) => const DexterHillNoteDialog());
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
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/dexter_hill/images/dexter_hill_note_background.png"))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
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
  static List<Widget> images = [];

  @override
  void initState() {
    super.initState();
    images = generateImageWidgets();
  }

  int pictureIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Album"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 500, width: 750, child: images[pictureIndex]),
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
                    onPressed: pictureIndex != 33
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

  List<Widget> generateImageWidgets() {
    final List<Widget> images = [];

    for (int i = 0; i < 33; i++) {
      images.add(Image.asset("assets/dexter_hill/images/dexter_images/dexter${i + 1}.png"));
    }
    images.add(EndOfPictures());
    return images;
  }
}


class EndOfGamePage extends StatelessWidget {
  const EndOfGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
            context.pop();
            context.pop();
            context.pop();
          },
        ),
        title: const Text("The End"),
      ),
      body: const Center(
        child: Column(
          children: [
            Text(endOfGameMessage),
          ],
        ),
      ),
    );
  }
}

class EndOfPictures extends StatelessWidget {
  const EndOfPictures({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("""You have now seen some of the best pictures with Dexter.
The pictures ranged from when he was young to the day he died. The final picture is the one
taken on his final day. There are so many great pictures of him. So many memories and adventures
I hope you liked the pictures, I know I did.
        """)
      ],
    );
  }
}

