import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'clicker_state.dart';
import 'models/income_source.dart';

part "clicker_ctrl.g.dart";

@riverpod
class ClickerCtrl extends _$ClickerCtrl {
  @override
  ClickerState build() => ClickerState.fromDefaults();

  void addIncome() {
    state = state.copyWith(
        balance: state.balance + state.totalIncome,
        dinoFood: state.dinoFood + state.incomeSources[IncomeSourceTitle.dinoFoodProducer]!.qty);
  }

  void addBalance(int value) {
    state = state.copyWith(balance: state.balance + value);
  }

  void removeBalance(int value) {
    state = state.copyWith(balance: state.balance - value);
  }

  void addDinoFood(int value) {
    state = state.copyWith(dinoFood: state.dinoFood + value);
  }

  void removeDinoFood(int value) {
    state = state.copyWith(dinoFood: state.dinoFood - value);
  }

  void addQty(IncomeSourceTitle value) {
    final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
    final incomeSource = incomeSources[value]!;

    incomeSources[value] = incomeSource.copyWith(
      qty: incomeSource.qty + 1,
      cost: incomeSource.cost * 2,
    );

    state = state.copyWith(incomeSources: Map<IncomeSourceTitle, IncomeSource>.unmodifiable(incomeSources));
  }

  void subtractQty(IncomeSourceTitle value) {
    final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
    final incomeSource = incomeSources[value]!;

    incomeSources[value] = incomeSource.copyWith(
      qty: incomeSource.qty - 1,
    );

    state = state.copyWith(incomeSources: Map<IncomeSourceTitle, IncomeSource>.unmodifiable(incomeSources));
  }

  void subtractClicksUntil(IncomeSourceTitle value) {
    final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
    final incomeSource = incomeSources[value]!;

    incomeSources[value] = incomeSource.copyWith(
      clicksUntil: incomeSource.clicksUntil - 1,
    );

    state = state.copyWith(incomeSources: Map<IncomeSourceTitle, IncomeSource>.unmodifiable(incomeSources));
  }

  void resetClicksUntil(IncomeSourceTitle value) {
    final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
    final incomeSource = incomeSources[value]!;

    incomeSources[value] = incomeSource.copyWith(
      clicksUntil: 50,
    );

    state = state.copyWith(incomeSources: Map<IncomeSourceTitle, IncomeSource>.unmodifiable(incomeSources));
  }

  void buyIncomeSource(IncomeSource source) {
    if (state.balance >= source.cost) {
      addQty(source.name);
      removeBalance(source.cost);
    }
  }

  void click() {
    state = state.copyWith(
      balance: state.balance + state.clickIncome,
    );
    if (state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.qty != 0) {
      subtractClicksUntil(IncomeSourceTitle.dinosaurEgg);

      if (state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.clicksUntil == 0) {
        while (state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.qty != 0) {
          subtractQty(IncomeSourceTitle.dinosaurEgg);
          int rngRoll = ClickerState.rng.nextInt(4);
          if (rngRoll == 3) {
          } else if (rngRoll == 2) {
            addQty(IncomeSourceTitle.parasaurolophus);
          } else {
            addQty(IncomeSourceTitle.iguanodon);
          }
        }
        resetClicksUntil(IncomeSourceTitle.dinosaurEgg);
      }
    }
  }
}
