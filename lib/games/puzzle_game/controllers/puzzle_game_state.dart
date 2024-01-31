import '../models/puzzle_piece.dart';

class PuzzleGameState {
  final List<PuzzlePiece> puzzleState;
  final bool puzzleCompleted;

  const PuzzleGameState({required this.puzzleState, this.puzzleCompleted = false});

  PuzzleGameState copyWith({
    List<PuzzlePiece>? puzzleState,
    bool? puzzleCompleted,
  }) {
    return PuzzleGameState(puzzleState: puzzleState ?? this.puzzleState,
    puzzleCompleted: puzzleCompleted ?? this.puzzleCompleted
    );
  }
}
