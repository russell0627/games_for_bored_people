import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';
import 'main_graveyard.dart';


class DexterHillCabinPage extends StatelessWidget {
  const DexterHillCabinPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cabin"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/dexter_hill/images/dexter_hill_cabin_exterior.png"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    context.goNamed(AppRoute.cabinInterior.name);
                  },
                  child: const Text("Go inside"))
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Cabin Interior"),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage("assets/dexter_hill/images/dexter_hill_cabin_interior.png"))),
        ),
      ),
    );
  }
}

class CabinBackyard extends StatelessWidget {
  const CabinBackyard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cabin Backyard"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 900,
                height: 384,
                child: Image.asset("assets/dexter_hill/images/atdh_cabin_backyard_background.png")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 300,
                    width: 300,
                    child: FunctionalImage(
                      imagePath: "assets/dexter_hill/images/gravestone_2.png",
                      onTapped: () =>
                          SmartDialog.show(builder: (_) => const CabinBackyardNoteDialog(useBaxterGrave: true)),
                    )),
                SizedBox(
                    height: 300, width: 300, child: Image.asset("assets/dexter_hill/images/new_graveyard_ground.png")),
                SizedBox(
                    height: 300,
                    width: 300,
                    child: FunctionalImage(
                      onTapped: () {
                        SmartDialog.show(builder: (_) => const CabinBackyardNoteDialog(useBaxterGrave: false));
                      },
                      imagePath: "assets/dexter_hill/images/gravestone_3.png",
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CabinBackyardNoteDialog extends StatelessWidget {
  final bool useBaxterGrave;

  const CabinBackyardNoteDialog({super.key, required this.useBaxterGrave});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Text(useBaxterGrave
            ? """I never knew Baxter. From what I have heard he seemed like a great dog.
             He was around before I was even alive.
        - Russell
        """
            : """I had never known Ginger. I don't have much to say about Ginger.
            - Russell
            """),
      ],
    );
  }
}
