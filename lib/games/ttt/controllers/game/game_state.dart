import '../ttt_board/ttt_board_state.dart';

class GameState {
  final GameStatus status;
  final Piece currentPlayer;

  const GameState({
    this.status = GameStatus.playing,
    this.currentPlayer = Piece.x,
  });

  GameState copyWith({
    GameStatus? status,
    Piece? currentPlayer,
  }) {
    return GameState(
      status: status ?? this.status,
      currentPlayer: currentPlayer ?? this.currentPlayer,
    );
  }
}

enum GameStatus {
  playing,
  xWins,
  oWins,
  draw;

  bool get hasWinner => this == GameStatus.xWins || this == GameStatus.oWins;
}