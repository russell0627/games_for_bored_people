class ClickerGameState {
  final int clickIncome;
  final int otherIncome;

  ClickerGameState({required this.clickIncome, required this.otherIncome});

  ClickerGameState copyWith({
    int? clickIncome,
    int? otherIncome,
  }) {
    return ClickerGameState(
      clickIncome: clickIncome ?? this.clickIncome,
      otherIncome: otherIncome ?? this.otherIncome,
    );
  }

}