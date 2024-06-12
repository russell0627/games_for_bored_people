class Rock {
  final RockType rockType;
  final bool isRevealed;

  Rock({required this.rockType, this.isRevealed = false});
}

enum RockType {
  stone,
  ore;
}