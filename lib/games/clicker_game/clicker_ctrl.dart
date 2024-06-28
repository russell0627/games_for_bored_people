import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'clicker_state.dart';

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
    state.copyWith(balance: state.balance + state.incomePerSecond);
  }
  void clickIncome() => state.copyWith(balance: state.balance + state.clickIncome);

}
