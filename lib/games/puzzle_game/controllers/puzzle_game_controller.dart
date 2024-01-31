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
      puzzleState: initializePuzzle(),
    );

    if (checkForWin()) {
      state.copyWith(
        puzzleState: initializePuzzle(),
      );
    }
  }

  void move(PuzzlePiece selectedPiece1, PuzzlePiece selectedPiece2) {
    final gameState = ref.read(puzzleGameCtrlProvider);

    final puzzleState = gameState.puzzleState;
    final piece1Index = puzzleState.indexOf(selectedPiece1);
    final piece2Index = puzzleState.indexOf(selectedPiece2);

    puzzleState[puzzleState.indexOf(selectedPiece1)].currentIndex = piece2Index;
    puzzleState[puzzleState.indexOf(selectedPiece2)].currentIndex = piece1Index;

    state.copyWith(
      puzzleState: puzzleState,
    );
  }

  @override
  PuzzleGameState build() => PuzzleGameState(puzzleState: initializePuzzle());

  bool checkForWin() {
    int piecesInCorrectPlaces = 0;

    for (PuzzlePiece piece in state.puzzleState) {
      if (piece.currentIndex == piece.correctIndex) {
        piecesInCorrectPlaces++;
      }
    }
    if (piecesInCorrectPlaces == 9) {
      return true;
    }
    return false;
  }

  List<PuzzlePiece> initializePuzzle() {
    List<PuzzlePiece> pieces = [];
    List<int> availableNumbers = [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    ];
    List<int> availableCorrectNumbers = [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    ];
    List<String> availableImagePaths = [
      "assets/puzzle_game/puzzle_pieces/1.png"
          "assets/puzzle_game/puzzle_pieces/2.png"
          "assets/puzzle_game/puzzle_pieces/3.png"
          "assets/puzzle_game/puzzle_pieces/4.png"
          "assets/puzzle_game/puzzle_pieces/5.png"
          "assets/puzzle_game/puzzle_pieces/6.png"
          "assets/puzzle_game/puzzle_pieces/7.png"
          "assets/puzzle_game/puzzle_pieces/8.png"
          "assets/puzzle_game/puzzle_pieces/9.png"
    ];
    for (int number in availableNumbers) {
      final int correctNumber = availableCorrectNumbers[rng.nextInt(availableCorrectNumbers.length)];
      final String imagePath = availableImagePaths[correctNumber];
      pieces.add(PuzzlePiece(currentIndex: number, correctIndex: correctNumber, imagePath: imagePath));
      availableImagePaths.remove(imagePath);
      availableNumbers.remove(number);
      availableCorrectNumbers.remove(correctNumber);
    }

    int piecesInCorrectPlaces = 0;

    for (PuzzlePiece piece in state.puzzleState) {
      if (piece.currentIndex == piece.correctIndex) {
        piecesInCorrectPlaces++;
      }
    }

    if (piecesInCorrectPlaces == 9) {
      initializePuzzle();
    } else {
      return pieces;
    }
    return [];
  }
}
