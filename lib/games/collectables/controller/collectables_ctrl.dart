import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/collectables.dart';
import '../models/collectable.dart';
import 'collectables_state.dart';

part 'collectables_ctrl.g.dart';

@riverpod
class CollectablesCtrl extends _$CollectablesCtrl {
  CollectablesState build() => CollectablesState();

  void addCollectable(Collectable collectable, bool dexterPart) {
    if (state.collectables.contains(collectable) || state.dexterCollectableParts.contains(collectable)) {
      return;
    } else if(dexterPart){
      state = state.copyWith(dexterCollectableParts: state.dexterCollectableParts..add(collectable));

      if (state.dexterCollectableParts.length == 4) {
        state.copyWith(collectables: state.collectables..add(collectables[CollectableName.fullDexter]!));
      }
    } else {
      state = state.copyWith(collectables: state.collectables..add(collectable));
    }
  }
}