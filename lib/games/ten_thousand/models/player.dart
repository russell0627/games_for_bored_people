class TTPlayer {
  final String name;
  final List<int> dice;
  final int numberOfDice;
  final int score;

  TTPlayer({
    required this.name,
    required this.dice,
    this.score = 0,
    this.numberOfDice = 6,
  });
}
