class IncomeSource {
  final String name;
  final int singularIncomePerSecond;
  final int qty;

  int get fullIncome => singularIncomePerSecond * qty;

  IncomeSource({
    required this.singularIncomePerSecond,
    required this.qty,
    required this.name,
  });

  IncomeSource copyWith({
    String? name,
    int? singularIncomePerSecond,
    int? qty,
  }) {
    return IncomeSource(
      name: name ?? this.name,
      singularIncomePerSecond: singularIncomePerSecond ?? this.singularIncomePerSecond,
      qty: qty ?? this.qty,
    );
  }
}
