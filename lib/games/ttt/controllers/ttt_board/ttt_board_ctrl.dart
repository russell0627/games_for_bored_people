import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'ttt_board_state.dart';

part 'ttt_board_ctrl.g.dart';

@riverpod
class TTTBoardCtrl extends _$TTTBoardCtrl {
  @override
  TTTBoardState build() => const TTTBoardState.empty();

  void reset() => state = build();

  void move(int cellID, Piece piece) {
    final grid = state.grid.toList();

    grid[cellID] = piece;

    state = state.copyWith(grid: List.unmodifiable(grid));
  }
}
