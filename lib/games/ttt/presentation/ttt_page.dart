import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/screen_utils.dart';
import '../../../widgets/grid_layout.dart';
import '../controllers/game/game_ctrl.dart';
import '../controllers/game/game_state.dart';
import '../controllers/ttt_board/ttt_board_ctrl.dart';
import '../controllers/ttt_board/ttt_board_state.dart';

class TTTPage extends ConsumerWidget {
  const TTTPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameCtrlProvider);

    final message = switch (state.status) {
      GameStatus.playing => "Player: ${state.currentPlayer}",
      GameStatus.xWins => "X Wins!",
      GameStatus.oWins => "O Wins!",
      GameStatus.draw => "Draw",
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tic-Tac-Toe",
          style: TextStyle(inherit: false, fontFamily: "TicTacToe", fontSize: 45),
        ),
        actions: [
          IconButton(
            tooltip: "Restart Game",
            onPressed: () => ref.read(gameCtrlProvider.notifier).reset(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: paddingAllM,
        child: Column(
          children: [
            Text(message),
            boxXL,
            Expanded(
              child: Board(currentPlayer: state.currentPlayer),
            ),
          ],
        ),
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
    final gameCtrl = ref.read(gameCtrlProvider.notifier);

    return GridLayout(
      children: List.generate(
        9,
        (index) {
          return PieceDisplay(
            index: index,
            piece: state[index],
            available: gameCtrl.isAvailable(index),
            onSelected: (index) => gameCtrl.move(
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
      onTap: available ? () => onSelected(index) : null,
      child: MouseRegion(
        cursor: available ? SystemMouseCursors.click : MouseCursor.defer,
        child: Container(
          //Color: #000a01
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/tic_tac_toe/icons/background.png")),
            border: _determineBorder(index, borderSide),
            // color: available ? Colors.lightBlueAccent.withOpacity(0.1) : null,
          ),
          child: piece != Piece.none
              ? Image.asset(
                  width: double.infinity,
                  height: double.infinity,
                  "assets/tic_tac_toe/icons/${piece == Piece.o ? "o.png" : "x.png"}",
                )
              : null,
        ),
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
