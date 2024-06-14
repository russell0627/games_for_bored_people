class Collectable {
  final CollectableName name;
  final String imagePath;
  final GameLocation location;

  const Collectable({required this.name, required this.imagePath, required this.location});

  @override
  String toString() {
    return 'Collectable{name: $name}';
  }
}

enum GameLocation {
  alphabetGame,
  brickBreaker,
  extraterrestrialExtermination,
  quizzez,
  none;
}

enum CollectableName {
  dexter1,
  dexter2,
  dexter3,
  dexter4,
  fullDexter;
}