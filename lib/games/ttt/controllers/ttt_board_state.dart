class TTTBoardState {
  static const gridSize = 9;

  static const winPatterns = [
    [0, 1, 2], // row 1
    [3, 4, 5], // row 2
    [6, 7, 8], // row 3
    [0, 3, 6], // col 1
    [1, 4, 7], // col 2
    [2, 5, 8], // col 3
    [0, 4, 8], // diag 1
    [2, 4, 6]  // diag 2
  ];

  final List<Piece> grid;

  const TTTBoardState({
    required this.grid,
  });

  factory TTTBoardState.empty() {
    return TTTBoardState(
      grid: List.unmodifiable(List.filled(gridSize, Piece.none)),
    );
  }

  TTTBoardState copyWith({
    List<Piece>? grid,
  }) {
    return TTTBoardState(
      grid: grid ?? this.grid,
    );
  }

  int get moveCount => grid.fold(
        0,
        (count, piece) => count + (piece != Piece.none ? 1 : 0),
      );

  bool get isFull => moveCount == gridSize;
  bool get isNotFull => !isFull;

  Piece? get winner {
    for (final pattern in winPatterns) {
      final cell1 = grid[pattern[0]];
      final cell2 = grid[pattern[1]];
      final cell3 = grid[pattern[2]];

      if (cell1 != Piece.none && cell1 == cell2 && cell1 == cell3) {
        return cell1;
      }
    }

    // if we get here, there is no winner
    return null;
  }

  Piece operator [](int cellID) {
    assert(cellID >= 0 && cellID < gridSize, "Invalid cell ID!");
    return grid[cellID];
  }

  @override
  String toString() {
    return '''
${grid[0]} | ${grid[1]} | ${grid[2]}
${grid[3]} | ${grid[4]} | ${grid[5]}
${grid[6]} | ${grid[7]} | ${grid[8]}
    ''';
  }
}

enum Piece {
  none,
  x,
  o;

  @override
  String toString() => switch (this) {
        Piece.none => ' ',
        _ => name.toUpperCase(),
      };
}
