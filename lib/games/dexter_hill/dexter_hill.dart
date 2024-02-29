import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                  context.goNamed(AppRoute.home.name);
                },
                child: const Text("Go Back To Home"),
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
  static List<Image> images = [];

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => () {
            context.pop();
          },
        ),
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
    final List<Image> images = [];

    for(int i = 0; i < 33; i++) {
      images.add(Image.asset("assets/dexter_hill/images/dexter_images/dexter${i + 1}.png"));
    }
    return images;
  }
}
