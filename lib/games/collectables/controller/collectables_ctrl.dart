import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/collectables.dart';
import '../models/collectable.dart';
import 'collectables_state.dart';

part 'collectables_ctrl.g.dart';

@Riverpod(keepAlive: true)
class CollectablesCtrl extends _$CollectablesCtrl {
  @override
  CollectablesState build() => CollectablesState();

  void addCollectable({required Collectable collectable, required bool dexterPart}) {
    if (state.collectables.contains(collectable) || state.dexterCollectableParts.contains(collectable)) {
      print("Set Contains Collectable");
      return;
    } else if (dexterPart) {
      print("Else if triggered");
      state = state.copyWith(
        dexterCollectableParts: Set.unmodifiable(
          state.dexterCollectableParts.toSet()..add(collectable),
        ),
      );

      if (state.dexterCollectableParts.length == 4) {
        state = state.copyWith(collectables: Set.unmodifiable(state.collectables.toSet()..add(collectables[CollectableName.fullDexter]!)));
      }
    } else {
      state = state.copyWith(collectables: Set.unmodifiable(state.collectables.toSet()..add(collectable)));
    }

    print(state.dexterCollectableParts);
  }
}
