import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/screen_utils.dart';
import '../../../widgets/grid_layout.dart';
import '../controllers/ttt_board_ctrl.dart';
import '../controllers/ttt_board_state.dart';

class TTTPage extends ConsumerWidget {
  const TTTPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic-Tac-Toe"),
      ),
      body: const Padding(
        padding: paddingAllM,
        child: Board(currentPlayer: Piece.x),
      ),
    );
  }
}

class Board extends ConsumerWidget {
  final Piece currentPlayer;

  const Board({super.key, required this.currentPlayer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tTTBoardCtrlProvider);

    return GridLayout(
      children: List.generate(
        9,
        (index) {
          return PieceDisplay(
            index: index,
            piece: state[index],
            onSelected: (index) => ref.read(tTTBoardCtrlProvider.notifier).move(
                  index,
                  currentPlayer,
                ),
          );
        },
      ),
    );
  }
}

class PieceDisplay extends StatelessWidget {
  static const borderSide = BorderSide(
    color: Colors.grey,
    width: 1.0,
    style: BorderStyle.solid,
  );

  final int index;
  final Piece piece;
  final bool available;
  final ValueChanged<int> onSelected;

  const PieceDisplay({
    super.key,
    required this.index,
    required this.piece,
    this.available = true,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(index),
      child: Container(
        //Color: #000a01
        decoration: BoxDecoration(
          border: _determineBorder(index, borderSide),
        ),
        child: piece != Piece.none
            ? FittedBox(
                child: Text(piece.toString()),
              )
            : null,
      ),
    );
  }

  Border? _determineBorder(int index, BorderSide borderSide) => switch (index) {
        0 => Border(bottom: borderSide, right: borderSide),
        1 => Border(left: borderSide, bottom: borderSide, right: borderSide),
        2 => Border(left: borderSide, bottom: borderSide),
        3 => Border(bottom: borderSide, right: borderSide, top: borderSide),
        4 => Border(left: borderSide, bottom: borderSide, right: borderSide, top: borderSide),
        5 => Border(left: borderSide, bottom: borderSide, top: borderSide),
        6 => Border(right: borderSide, top: borderSide),
        7 => Border(left: borderSide, top: borderSide, right: borderSide),
        8 => Border(left: borderSide, top: borderSide),
        _ => null,
      };
}
