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

  void subtractQty(IncomeSourceTitle incomeSourceTitle) {
    final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
    final incomeSource = incomeSources[incomeSourceTitle]!;

    incomeSources[incomeSourceTitle] = incomeSource.copyWith(
      qty: incomeSource.qty - 1,
    );

    state = state.copyWith(incomeSources: Map<IncomeSourceTitle, IncomeSource>.unmodifiable(incomeSources));
  }

  void resetQty(IncomeSourceTitle incomeSourceTitle) {
    final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
    final incomeSource = incomeSources[incomeSourceTitle]!;

    incomeSources[incomeSourceTitle] = incomeSource.copyWith(
      qty: 0,
    );

    state = state.copyWith(incomeSources: Map<IncomeSourceTitle, IncomeSource>.unmodifiable(incomeSources));
  }

  void subtractSecondsUntil(IncomeSourceTitle value) {
    final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
    final incomeSource = incomeSources[value]!;

    incomeSources[value] = incomeSource.copyWith(
      secondsUntil: incomeSource.secondsUntil - 1,
    );
    if (incomeSources[value]!.secondsUntil == 0) {
      if (incomeSources[value]!.name == IncomeSourceTitle.dinosaurEgg) {}
    }

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

  void hatchEggs() {
    if (state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.secondsUntil == 0) {
      final incomeSources = Map<IncomeSourceTitle, IncomeSource>.from(state.incomeSources);
      for (int i = 0; i < state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.qty; i++) {
        final rngRoll = ClickerState.rng.nextInt(4);

        switch (rngRoll) {
          case 4:
            incomeSources[IncomeSourceTitle.tyrannosaurusRex] = incomeSources[IncomeSourceTitle.tyrannosaurusRex]!
                .copyWith(qty: incomeSources[IncomeSourceTitle.tyrannosaurusRex]!.qty + 1);
          case 3:
            incomeSources[IncomeSourceTitle.parasaurolophus] = incomeSources[IncomeSourceTitle.parasaurolophus]!
                .copyWith(qty: incomeSources[IncomeSourceTitle.parasaurolophus]!.qty + 1);
          default:
            incomeSources[IncomeSourceTitle.iguanodon] = incomeSources[IncomeSourceTitle.iguanodon]!
                .copyWith(qty: incomeSources[IncomeSourceTitle.iguanodon]!.qty + 1);
        }
      }
      incomeSources[IncomeSourceTitle.dinosaurEgg] = incomeSources[IncomeSourceTitle.dinosaurEgg]!.copyWith(
        secondsUntil: 50,
      );

      incomeSources[IncomeSourceTitle.dinosaurEgg] = incomeSources[IncomeSourceTitle.dinosaurEgg]!.copyWith(qty: 0);
      state = state.copyWith(incomeSources: Map<IncomeSourceTitle, IncomeSource>.unmodifiable(incomeSources));
    }
  }

  void feedDinosaurs() {
    int dinoI = state.incomeSources[IncomeSourceTitle.iguanodon]!.qty;
    int dinoP = state.incomeSources[IncomeSourceTitle.parasaurolophus]!.qty;
    if (state.maxEggs > state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.qty) {
      for (int i = 0;
          i >
              state.incomeSources[IncomeSourceTitle.iguanodon]!.qty +
                  state.incomeSources[IncomeSourceTitle.tyrannosaurusRex]!.qty +
                  state.incomeSources[IncomeSourceTitle.parasaurolophus]!.qty;
          i++) {
        final rngRoll = ClickerState.rng.nextInt(4) + 1;
        if (state.maxEggs > state.incomeSources[IncomeSourceTitle.dinosaurEgg]!.qty) {
          if (rngRoll == 4) {
            addQty(IncomeSourceTitle.dinosaurEgg);
          }
        }
      }
    }
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
  }
}
