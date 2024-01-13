
class TwentyRollersCard {
  final String cardName;
  final CardEffect cardEffect;

  TwentyRollersCard({required this.cardName, required this.cardEffect});
}

enum CardEffect {
  plus1,
  minus1,
  plus2,
  minus2,
  switchNumbers;
}
