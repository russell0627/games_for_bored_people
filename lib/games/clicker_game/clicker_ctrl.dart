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

  void subtractSecondsUntil(IncomeSourceTitle value) {
    final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
    final incomeSource = incomeSources[value]!;

    incomeSources[value] = incomeSource.copyWith(
      secondsUntil: incomeSource.secondsUntil - 1,
    );

    state = state.copyWith(incomeSources: Map<IncomeSourceTitle, IncomeSource>.unmodifiable(incomeSources));
  }

  void resetSecondsUntil(IncomeSourceTitle value) {
    final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
    final incomeSource = incomeSources[value]!;

    incomeSources[value] = incomeSource.copyWith(
      secondsUntil: 50,
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
  }
}
