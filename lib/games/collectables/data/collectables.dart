import '../models/collectable.dart';

const Map<CollectableName, Collectable> collectables = {
  CollectableName.dexter1: Collectable(
      name: "Dexter Part 1", imagePath: "assets/collectables/dexter_1_cble.png", location: GameLocation.quizzez),
  CollectableName.dexter2: Collectable(
      name: "Dexter Part 2", imagePath: "assets/collectables/dexter_2_cble.png", location: GameLocation.alphabetGame),
  CollectableName.dexter3: Collectable(
      name: "Dexter Part 3",
      imagePath: "assets/collectables/dexter_3_cble.png",
      location: GameLocation.extraterrestrialExtermination),
  CollectableName.dexter4: Collectable(
      name: "Dexter Part 4", imagePath: "assets/collectables/dexter_4_cble.png", location: GameLocation.brickBreaker),
  CollectableName.fullDexter: Collectable(name: "Dexter Figure", imagePath: "assets/collectables/dexter_cble.png", location: GameLocation.none),
};
