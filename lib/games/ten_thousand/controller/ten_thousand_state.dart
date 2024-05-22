import '../models/player.dart';

class TenThousandState {
  final int currentPlayerIndex;
  final List<TTPlayer> players;
  final int pendingPoints;

  TenThousandState({
    required this.currentPlayerIndex,
    required this.players,
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
