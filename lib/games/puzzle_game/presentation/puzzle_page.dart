import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/grid_layout.dart';
import '../controllers/puzzle_game_controller.dart';
import '../models/puzzle_piece.dart';

PuzzlePiece? selectedPiece1;
PuzzlePiece? selectedPiece2;

class PuzzlePage extends ConsumerWidget {
  const PuzzlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Puzzle Game"),
      ),
      body: Center(
        child: Column(
          children: [GridLayout(children: generatePuzzleDisplays(ref))],
        ),
      ),
    );
  }

  List<PuzzlePieceDisplay> generatePuzzleDisplays(WidgetRef ref) {
    final state = ref.watch(puzzleGameCtrlProvider);
    final List<PuzzlePieceDisplay> displays = [];

    for (PuzzlePiece piece in state.puzzleState) {
      displays.add(PuzzlePieceDisplay(piece: piece));
    }
    return displays;
  }
}

class PuzzlePieceDisplay extends ConsumerWidget {
  final PuzzlePiece piece;

  const PuzzlePieceDisplay({super.key, required this.piece});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => checkForMove(ref),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(piece.imagePath))),
      ),
    );
  }

  void checkForMove(WidgetRef ref) {
    final ctrl = ref.watch(puzzleGameCtrlProvider.notifier);

    if (selectedPiece1 == null) {
      selectedPiece1 = piece;
    } else {
      selectedPiece2 = piece;
      ctrl.move(selectedPiece1!, selectedPiece2!);
    }
  }
}
