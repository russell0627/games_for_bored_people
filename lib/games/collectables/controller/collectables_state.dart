import '../models/collectable.dart';

class CollectablesState {
  final Set<Collectable> collectables;
  final Set<Collectable> dexterCollectableParts;

  CollectablesState({this.collectables = const {}, this.dexterCollectableParts = const {}});

  CollectablesState copyWith({
    Set<Collectable>? collectables,
    Set<Collectable>? dexterCollectableParts,
  }) {
    return CollectablesState(
      collectables: collectables ?? this.collectables,
      dexterCollectableParts: dexterCollectableParts ?? this.dexterCollectableParts,
    );
  }

}