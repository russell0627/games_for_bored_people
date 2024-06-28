import 'models/income_source.dart';

class ClickerState {
  final int balance;
  final Set<IncomeSource> incomeSources;
  final int clickIncome;

  int get incomePerSecond {
    int income = 0;
    for (IncomeSource source in incomeSources) {
      income += source.fullIncome;
    }
    return income;
  }

  ClickerState({
    this.balance = 0,
    this.incomeSources = const {},
    this.clickIncome = 1,
  });

  ClickerState copyWith({
    int? balance,
    Set<IncomeSource>? incomeSources,
  }) {
    return ClickerState(
      balance: balance ?? this.balance,
      incomeSources: incomeSources ?? this.incomeSources,
    );
  }
}

