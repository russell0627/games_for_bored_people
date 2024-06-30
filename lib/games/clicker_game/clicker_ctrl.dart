import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'clicker_state.dart';
import 'models/income_source.dart';
import 'presentation/clicker_page.dart';

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
    state = state.copyWith(balance: state.dinoFood + value);
  }

  void removeDinoFood(int value) {
    state = state.copyWith(balance: state.dinoFood - value);
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
      clicksUntilIncome: state.clicksUntilIncome - 1,
    );
    if (state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.qty != 0) {
      subtractClicksUntil(IncomeSourceTitle.dinosaurEgg);

      if (state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.clicksUntil == 0) {
        while (state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.qty != 0) {
          subtractQty(IncomeSourceTitle.dinosaurEgg);
          int rngRoll = ClickerState.rng.nextInt(3);
          if (rngRoll == 3) {
            addQty(IncomeSourceTitle.parasaurolophus);
          } else {
            addQty(IncomeSourceTitle.iguanodon);
          }
        }
        resetClicksUntil(IncomeSourceTitle.dinosaurEgg);
      }
    }

    if (state.clicksUntilIncome == 0) {
      int dinoI = state.incomeSources[IncomeSourceTitle.iguanodon]!.qty;
      int dinoP = state.incomeSources[IncomeSourceTitle.parasaurolophus]!.qty;

      addIncome();
       if (state.dinoFood >= state.incomeSources[IncomeSourceTitle.dinoFoodProducer]!.qty) {
        state.copyWith(dinoFood: state.dinoFood - state.incomeSources[IncomeSourceTitle.dinoFoodProducer]!.qty);
      } else {
        int food = state.dinoFood;
        dinoP = -food;
        while (dinoP != state.incomeSources[IncomeSourceTitle.parasaurolophus]!.qty) {
          subtractQty(IncomeSourceTitle.parasaurolophus);
        }
        dinoI = -food;
        while (dinoI != state.incomeSources[IncomeSourceTitle.iguanodon]!.qty) {
          subtractQty(IncomeSourceTitle.iguanodon);
        }
      }
      state = state.copyWith(clicksUntilIncome: 10);
    }
  }
}
