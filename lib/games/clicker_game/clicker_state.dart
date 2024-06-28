import 'data/income_sources.dart';
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
  Set<IncomeSource> get unownedIncomeSources {
    Set<IncomeSource> newSet = allIncomeSources.values.toSet();

    for(IncomeSource source in allIncomeSources.values) {
      for(IncomeSource source2 in incomeSources) {
        if(source.name == source2.name) {
          newSet.remove(source);
        }
      }


    }
    return newSet;
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
