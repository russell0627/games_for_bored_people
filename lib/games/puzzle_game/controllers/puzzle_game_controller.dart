import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/puzzle_piece.dart';
import 'puzzle_game_state.dart';

part 'puzzle_game_controller.g.dart';

final Random rng = Random();

@riverpod
class PuzzleGameCtrl extends _$PuzzleGameCtrl {
  void reset() {
    state.copyWith(
      puzzleCompleted: false,
      puzzleState: initializePuzzle("assets/puzzle_game/puzzle_pieces/"),
    );

    if (checkForWin()) {
      state.copyWith(
        puzzleState: initializePuzzle("assets/puzzle_game/puzzle_pieces/"),
      );
    }
  }

  void move(PuzzlePiece selectedPiece1, PuzzlePiece selectedPiece2) {
    final gameState = ref.read(puzzleGameCtrlProvider);

    final puzzleState = gameState.puzzleState;
    final piece1Index = puzzleState.indexOf(selectedPiece1);
    final piece2Index = puzzleState.indexOf(selectedPiece2);

    puzzleState.remove(selectedPiece1);
    puzzleState.insert(piece2Index, selectedPiece1);
    puzzleState.remove(selectedPiece2);
    puzzleState.insert(piece1Index, selectedPiece2);

    state.copyWith(
      puzzleState: puzzleState,
    );
  }

  @override
  PuzzleGameState build() => PuzzleGameState(puzzleState: initializePuzzle("assets/puzzle_game/puzzle_pieces/"));

  bool checkForWin() {
    int piecesInCorrectPlaces = 0;

    for (PuzzlePiece piece in state.puzzleState) {
      if (state.puzzleState.indexOf(piece) == piece.correctIndex) {
        piecesInCorrectPlaces++;
      }
    }
    if (piecesInCorrectPlaces == 9) {
      return true;
    }
    return false;
  }

  List<PuzzlePiece> initializePuzzle(String imagePath) {
    List<PuzzlePiece> pieces = [
      PuzzlePiece(correctIndex: 1, imagePath: "${imagePath}1.png"),
      PuzzlePiece(correctIndex: 2, imagePath: "${imagePath}2.png"),
      PuzzlePiece(correctIndex: 3, imagePath: "${imagePath}3.png"),
      PuzzlePiece(correctIndex: 4, imagePath: "${imagePath}4.png"),
      PuzzlePiece(correctIndex: 5, imagePath: "${imagePath}5.png"),
      PuzzlePiece(correctIndex: 6, imagePath: "${imagePath}6.png"),
      PuzzlePiece(correctIndex: 7, imagePath: "${imagePath}7.png"),
      PuzzlePiece(correctIndex: 8, imagePath: "${imagePath}8.png"),
      PuzzlePiece(correctIndex: 9, imagePath: "${imagePath}9.png"),
    ];

    return pieces;
  }
}
