import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../collectables/controller/collectables_ctrl.dart';
import '../collectables/data/collectables.dart';
import '../collectables/models/collectable.dart';
import '../dexter_hill/main_graveyard.dart';

class AlphabetGamePage extends StatefulWidget {
  const AlphabetGamePage({super.key});

  @override
  State<AlphabetGamePage> createState() => _AlphabetGamePageState();
}

class _AlphabetGamePageState extends State<AlphabetGamePage> {
  bool alphabetA = false;
  bool alphabetB = false;
  bool alphabetC = false;
  bool alphabetD = false;
  bool alphabetE = false;
  bool alphabetF = false;
  bool alphabetG = false;
  bool alphabetH = false;
  bool alphabetI = false;
  bool alphabetJ = false;
  bool alphabetK = false;
  bool alphabetL = false;
  bool alphabetM = false;
  bool alphabetN = false;
  bool alphabetO = false;
  bool alphabetP = false;
  bool alphabetQ = false;
  bool alphabetR = false;
  bool alphabetS = false;
  bool alphabetT = false;
  bool alphabetU = false;
  bool alphabetV = false;
  bool alphabetW = false;
  bool alphabetX = false;
  bool alphabetY = false;
  bool alphabetZ = false;

  @override
  Widget build(BuildContext context) {
    if (alphabetA &&
        alphabetB &&
        alphabetC &&
        alphabetD &&
        alphabetE &&
        alphabetF &&
        alphabetG &&
        alphabetH &&
        alphabetI &&
        alphabetJ &&
        alphabetK &&
        alphabetL &&
        alphabetM &&
        alphabetN &&
        alphabetO &&
        alphabetP &&
        alphabetQ &&
        alphabetR &&
        alphabetS &&
        alphabetT &&
        alphabetU &&
        alphabetV &&
        alphabetW &&
        alphabetX &&
        alphabetY &&
        alphabetZ) {

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alphabet Game",
            style: TextStyle(
              inherit: false,
              fontFamily: "Merienda",
            )),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                alphabetA = false;
                alphabetB = false;
                alphabetC = false;
                alphabetD = false;
                alphabetE = false;
                alphabetF = false;
                alphabetG = false;
                alphabetH = false;
                alphabetI = false;
                alphabetJ = false;
                alphabetK = false;
                alphabetL = false;
                alphabetM = false;
                alphabetN = false;
                alphabetO = false;
                alphabetP = false;
                alphabetQ = false;
                alphabetR = false;
                alphabetS = false;
                alphabetT = false;
                alphabetU = false;
                alphabetV = false;
                alphabetW = false;
                alphabetX = false;
                alphabetY = false;
                alphabetZ = false;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Row(
                children: [
                  const Text("A"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetA,
                        onChanged: (_) {
                          alphabetA = !alphabetA;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("B"),
                  Switch(
                      value: alphabetB,
                      onChanged: (_) {
                        alphabetB = !alphabetB;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("C"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetC,
                        onChanged: (_) {
                          alphabetC = !alphabetC;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("D"),
                  Switch(
                      value: alphabetD,
                      onChanged: (_) {
                        alphabetD = !alphabetD;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("E"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetE,
                        onChanged: (_) {
                          alphabetE = !alphabetE;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("F"),
                  Switch(
                      value: alphabetF,
                      onChanged: (_) {
                        alphabetF = !alphabetF;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("G"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetG,
                        onChanged: (_) {
                          alphabetG = !alphabetG;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("H"),
                  Switch(
                      value: alphabetH,
                      onChanged: (_) {
                        alphabetH = !alphabetH;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("I"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetI,
                        onChanged: (_) {
                          alphabetI = !alphabetI;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("J"),
                  Switch(
                      value: alphabetJ,
                      onChanged: (_) {
                        alphabetJ = !alphabetJ;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("K"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetK,
                        onChanged: (_) {
                          alphabetK = !alphabetK;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("L"),
                  Switch(
                      value: alphabetL,
                      onChanged: (_) {
                        alphabetL = !alphabetL;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("M"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetM,
                        onChanged: (_) {
                          alphabetM = !alphabetM;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("N"),
                  Switch(
                      value: alphabetN,
                      onChanged: (_) {
                        alphabetN = !alphabetN;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("O"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetO,
                        onChanged: (_) {
                          alphabetO = !alphabetO;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("P"),
                  Switch(
                      value: alphabetP,
                      onChanged: (_) {
                        alphabetP = !alphabetP;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("Q"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetQ,
                        onChanged: (_) {
                          alphabetQ = !alphabetQ;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("R"),
                  Switch(
                      value: alphabetR,
                      onChanged: (_) {
                        alphabetR = !alphabetR;

                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("S"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetS,
                        onChanged: (_) {
                          alphabetS = !alphabetS;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("T"),
                  Switch(
                      value: alphabetT,
                      onChanged: (_) {
                        alphabetT = !alphabetT;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("U"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetU,
                        onChanged: (_) {
                          alphabetU = !alphabetU;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("V"),
                  Switch(
                      value: alphabetV,
                      onChanged: (_) {
                        alphabetV = !alphabetV;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("W"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetW,
                        onChanged: (_) {
                          alphabetW = !alphabetW;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("X"),
                  Switch(
                      value: alphabetX,
                      onChanged: (_) {
                        alphabetX = !alphabetX;
                        setState(() {});
                      }),
                ],
              ),
              Row(
                children: [
                  const Text("Y"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                        value: alphabetY,
                        onChanged: (_) {
                          alphabetY = !alphabetY;
                          setState(() {});
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Z"),
                  Switch(
                      value: alphabetZ,
                      onChanged: (_) {
                        alphabetZ = !alphabetZ;
                        setState(() {});
                      }),
                ],
              ),
              const SizedBox(
                height: 8,
              )
            ]),
          ),
        ),
      ),
    );
  }
}

const List<String> englishAlphabet = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

class WinDialog extends ConsumerWidget {
  const WinDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(collectablesCtrlProvider);
    final ctrl = ref.watch(collectablesCtrlProvider.notifier);

    return SimpleDialog(
      children: [Text("You Win!"),
        FunctionalImage(
            onTapped: () => ctrl.addCollectable(
                collectable: collectables[CollectableName.dexter2]!, dexterPart: true),
            imagePath: collectables[CollectableName.dexter2]!.imagePath)

      ],
    );
  }
}
