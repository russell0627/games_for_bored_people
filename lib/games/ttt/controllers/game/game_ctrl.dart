import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../ttt_board/ttt_board_ctrl.dart';
import '../ttt_board/ttt_board_state.dart';
import 'game_state.dart';

part 'game_ctrl.g.dart';

@riverpod
class GameCtrl extends _$GameCtrl {
  @override
  GameState build() => const GameState();

  void reset() {
    ref.read(tTTBoardCtrlProvider.notifier).reset();
    state = build();
  }

  void move(int cellID, Piece piece) {
    final boardCtrl = ref.read(tTTBoardCtrlProvider.notifier);

    boardCtrl.move(cellID, piece);

    final boardState = boardCtrl.state;

    final GameStatus status;

    final winner = boardState.winner;

    if (winner != null) {
      status = switch (winner) {
        Piece.x => GameStatus.xWins,
        Piece.o => GameStatus.oWins,
        _ => GameStatus.playing,
      };
    } else {
      status = boardState.isFull ? GameStatus.draw : GameStatus.playing;
    }

    state = state.copyWith(
      status: status,
      currentPlayer: state.currentPlayer == Piece.x ? Piece.o : Piece.x,
    );
  }

  bool isAvailable(int cellID) =>
      state.status == GameStatus.playing && ref.read(tTTBoardCtrlProvider).isAvailable(cellID);
}
