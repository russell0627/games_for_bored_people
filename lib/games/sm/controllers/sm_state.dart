class SmState {
  static const Map<WinType, int> winMap = {
    WinType.triple1 : 3,
    WinType.triple2 : 4,
    WinType.triple3 : 5,
    WinType.triple4 : 10,
    WinType.triple5 : 6,
    WinType.triple6 : 7,
    WinType.mismatch : 1,
  };

  final int score;
  final int space1;
  final int space2;
  final int space3;

  SmState({required this.score, this.space1 = 1, this.space2 = 1, this.space3 = 1});

  SmState copyWith({
    int? score,
    int? space1,
    int? space2,
    int? space3,
  }) {
    return SmState(
      score: score ?? this.score,
      space1: space1 ?? this.space1,
      space2: space2 ?? this.space2,
      space3: space3 ?? this.space3,
    );
  }

}

enum WinType {
  triple1,
  triple2,
  triple3,
  triple4,
  triple5,
  triple6,
  mismatch,
}