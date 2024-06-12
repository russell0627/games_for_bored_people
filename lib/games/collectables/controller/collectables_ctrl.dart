import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/collectables.dart';
import '../models/collectable.dart';
import 'collectables_state.dart';

part 'collectables_ctrl.g.dart';

@riverpod
class CollectablesCtrl extends _$CollectablesCtrl {
  @override
  CollectablesState build() => CollectablesState();

  void addCollectable({required Collectable collectable, required bool dexterPart}) {
    if (state.collectables.contains(collectable) || state.dexterCollectableParts.contains(collectable)) {
      return;
    } else if (dexterPart) {
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
  }
}
