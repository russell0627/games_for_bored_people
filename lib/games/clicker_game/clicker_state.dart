import 'dart:math';

import 'models/income_source.dart';

class ClickerState {
  static final defaultIncomeSources = Map<IncomeSourceTitle, IncomeSource>.unmodifiable({
    IncomeSourceTitle.clickIncomeUpgrade: const IncomeSource(
      singularIncome: 0,
      qty: 0,
      name: IncomeSourceTitle.clickIncomeUpgrade,
      cost: 100,
    ),
    IncomeSourceTitle.incubator: const IncomeSource(
      singularIncome: 1,
      qty: 0,
      name: IncomeSourceTitle.incubator,
      cost: 10,
    ),
    IncomeSourceTitle.doubleIncubator: const IncomeSource(
      singularIncome: 5,
      qty: 0,
      name: IncomeSourceTitle.doubleIncubator,
      cost: 30,
    ),
    IncomeSourceTitle.dinoFoodProducer: const IncomeSource(
      singularIncome: 0,
      qty: 0,
      name: IncomeSourceTitle.dinoFoodProducer,
      cost: 50,
    ),
    IncomeSourceTitle.dinosaurEgg: const IncomeSource(
      singularIncome: 0,
      qty: 0,
      name: IncomeSourceTitle.dinosaurEgg,
      cost: 50,
      clicksUntil: 50,
    ),
    IncomeSourceTitle.iguanodon: const IncomeSource(
      singularIncome: 100,
      qty: 0,
      name: IncomeSourceTitle.iguanodon,
      cost: 0,
    ),
    IncomeSourceTitle.parasaurolophus: const IncomeSource(
      singularIncome: 150,
      qty: 0,
      name: IncomeSourceTitle.parasaurolophus,
      cost: 0,
    ),
    IncomeSourceTitle.tyrannosaurusRex: const IncomeSource(
      singularIncome: 250,
      qty: 0,
      name: IncomeSourceTitle.tyrannosaurusRex,
      cost: 0,
    ),
  });
  static final rng = Random();

  final int balance;
  final int dinoFood;
  final int clicksUntilIncome;
  final Map<IncomeSourceTitle, IncomeSource> incomeSources;

  int get totalIncome {
    int income = 0;

    for (IncomeSource source in incomeSources.values) {
      income += source.fullIncome;
    }

    return income;
  }

  int get clickIncome => 1 + incomeSources[IncomeSourceTitle.clickIncomeUpgrade]!.qty;

  int get maxEggs =>
      incomeSources[IncomeSourceTitle.incubator]!.qty + incomeSources[IncomeSourceTitle.doubleIncubator]!.qty * 2;

  const ClickerState({
    required this.dinoFood,
    required this.clicksUntilIncome,
    required this.balance,
    required this.incomeSources,
  });

  factory ClickerState.fromDefaults({
    int clicksUntilIncome = 10,
    int balance = 0,
    int dinoFood = 0,
    Map<IncomeSourceTitle, IncomeSource>? incomeSources,
  }) {
    return ClickerState(
      dinoFood: dinoFood,
      clicksUntilIncome: clicksUntilIncome,
      balance: balance,
      incomeSources: incomeSources ?? defaultIncomeSources,
    );
  }

  ClickerState copyWith({
    int? balance,
    int? dinoFood,
    int? clicksUntilIncome,
    Map<IncomeSourceTitle, IncomeSource>? incomeSources,
  }) {
    return ClickerState(
      balance: balance ?? this.balance,
      dinoFood: dinoFood ?? this.dinoFood,
      clicksUntilIncome: clicksUntilIncome ?? this.clicksUntilIncome,
      incomeSources: incomeSources ?? this.incomeSources,
    );
  }
}
