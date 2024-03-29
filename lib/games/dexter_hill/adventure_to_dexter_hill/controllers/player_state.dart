import '../dungeon_challenge.dart';

class PlayerState {
  final int goldCount;
  final bool hasHorse;
  final int daysUntilHillFound;
  final bool hasGrapplingHook;
  final bool hasSword;
  final bool hasCrossbow;

  PlayerState({
    required this.hasGrapplingHook,
    required this.hasSword,
    required this.hasCrossbow,
    required this.goldCount,
    required this.hasHorse,
    required this.daysUntilHillFound,
  });

  ChallengeType get challengeType {
    if (hasGrapplingHook) {
      return ChallengeType.grapplingHook;
    }  else if (hasCrossbow) {
      return ChallengeType.crossbow;
    } else {
      return ChallengeType.sword;
    }
  }
  PlayerState copyWith({
    int? goldCount,
    bool? hasHorse,
    int? daysUntilHillFound,
    bool? hasGrapplingHook,
    bool? hasSword,
    bool? hasCrossbow,
  }) {
    return PlayerState(
      goldCount: goldCount ?? this.goldCount,
      hasHorse: hasHorse ?? this.hasHorse,
      hasCrossbow: hasCrossbow ?? this.hasCrossbow,
      hasSword: hasSword ?? this.hasSword,
      hasGrapplingHook: hasGrapplingHook ?? this.hasGrapplingHook,
      daysUntilHillFound: daysUntilHillFound ?? this.daysUntilHillFound,
    );
  }
}
