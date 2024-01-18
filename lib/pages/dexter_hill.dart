import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';

const String noteToDexter = """For me, many pets have come and gone. 
Dexter, was one of the best. 
He was with us for so many years, almost my entire life as of writing this. 
But alas, all good things must come to an end. I got to be there from some of his early years through to his final day. 
I loved him. He was a great dog. 
I will always remember him as my grandpa's best bud.

And when it is Oscar's time to go, I will put him up on the hill with Dexter, so they can be together, once more.

- Russell""";

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
              fit: BoxFit.cover ,
              image: AssetImage("assets/dexter_hill/images/dexter_hill_with_note.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(onPressed: () => showDialog(context: context, builder: (_) => const DexterHillNoteDialog()), child: const Text("Read Note")),
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
