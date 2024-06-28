import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'clicker_state.dart';
import 'models/income_source.dart';

part "clicker_ctrl.g.dart";

@riverpod
class ClickerCtrl extends _$ClickerCtrl {
  @override
  ClickerState build() {
    incomeTimer = Timer(const Duration(seconds: 1), () => addIncome());
    return ClickerState(balance: 0, incomeSources: {});
  }

  late Timer incomeTimer;

  void addIncome() {
    state = state.copyWith(balance: state.balance + state.incomePerSecond);
  }

  void removeBalance(int value) {
    state = state.copyWith(balance: state.balance - value);
  }

  void updateIncomeSources(Set<IncomeSource> newSet) {
    state = state.copyWith(incomeSources: newSet);
  }

  void click() {
    state = state.copyWith(balance: state.balance + state.clickIncome);
    print(state.clickIncome);
    print(state.balance);
  }
}
