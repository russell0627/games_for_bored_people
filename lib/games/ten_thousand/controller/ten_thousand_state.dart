import '../models/player.dart';

class TenThousandState {
  final int currentPlayerIndex;
  final List<TTPlayer> players;
  final List<int> selectedDiceIndex;
  final int pendingPoints;
  final bool diceRolled;

  TenThousandState({
    this.diceRolled = false,
    required this.currentPlayerIndex,
    required this.players,
    this.selectedDiceIndex = const [],
    this.pendingPoints = 0,
  });

  TenThousandState copyWith({
    int? currentPlayerIndex,
    List<TTPlayer>? players,
    int? pendingPoints
  }) {
    return TenThousandState(
      currentPlayerIndex: currentPlayerIndex ?? this.currentPlayerIndex,
      players: players ?? this.players,
      pendingPoints: pendingPoints ?? this.pendingPoints,
    );
  }
}
