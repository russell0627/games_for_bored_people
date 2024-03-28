import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';
import '../../../../data/atdh_locations.dart';
import '../../cabin.dart';
import '../../dexter_hill.dart';
import '../../main_graveyard.dart';
import '../controllers/atdh_ctrl.dart';
import '../dungeon_challenge.dart';
import '../field.dart';
import '../jungle_to_dexter_hill.dart';
import '../shop.dart';
import '../story_page.dart';
import '../treasure_room.dart';

class AdventureToDexterHillPage extends ConsumerWidget {
  const AdventureToDexterHillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aTDhControllerProvider);
    final ctrl = ref.read(aTDhControllerProvider.notifier);

    print(state.currentLocation);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adventure To Dexter Hill"),
      ),
      body: switch (state.currentLocation) {
        Location.mainGraveyard => const MainGraveyardPage(),
        Location.jungleEntrance => const JungleToDexterHill(),
        // Location.jungleExit => const JungleExit(),
        Location.field => const FieldPage(isField2: false),
        Location.shop => const VillageShop(),
        Location.dungeon => const DungeonChallengePage(),
        Location.treasureRoom => const TreasureRoom(),
        Location.dexterHill => const DexterHillPage(),
        Location.cabin => const DexterHillCabinPage(),
        Location.storyPage1 => const StoryPage(
            pageNumber: 1,
            pageAssetPath: "assets/dexter_hill/images/story_pages/page_1.png",
          ),
        Location.storyPage2 => const StoryPage(
            pageNumber: 2,
            pageAssetPath: "assets/dexter_hill/images/story_pages/page_2.png",
          ),
        Location.storyPage3 => const StoryPage(
            pageNumber: 3,
            pageAssetPath: "assets/dexter_hill/images/story_pages/page_3.png",
          ),
        Location.storyPage4 => const StoryPage(
            pageNumber: 4,
            pageAssetPath: "assets/dexter_hill/images/story_pages/page_4.png",
          ),
        Location.storyPage5 => const StoryPage(
            pageNumber: 5,
            pageAssetPath: "assets/dexter_hill/images/story_pages/page_5.png",
          ),
        Location.storyPage6 => const StoryPage(
            pageNumber: 6,
            pageAssetPath: "assets/dexter_hill/images/story_pages/page_6.png",
          ),
        Location.storyPage7 => const StoryPage(
            pageNumber: 7,
            pageAssetPath: "assets/dexter_hill/images/story_pages/page_7.png",
          ),
        Location.storyPage8 => const StoryPage(
            pageNumber: 8,
            pageAssetPath: "assets/dexter_hill/images/story_pages/page_8.png",
          ),
      },
    );
  }
}

class InstructionsDialog extends StatelessWidget {
  final String instructionText;
  final Location location;

  const InstructionsDialog({super.key, required this.instructionText, required this.location});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("${location.name.titleCase} Instructions"),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(instructionText),
        ),
      ],
    );
  }
}
