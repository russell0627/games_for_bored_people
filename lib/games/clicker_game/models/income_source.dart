class IncomeSource {
  final IncomeSourceTitle name;
  final int singularIncomePerSecond;
  final int qty;
  final int cost;

  int get fullIncome => singularIncomePerSecond * qty;

  const IncomeSource({
    required this.singularIncomePerSecond,
    required this.qty,
    required this.name,
    required this.cost,
  });

  IncomeSource copyWith({
    IncomeSourceTitle? name,
    int? singularIncomePerSecond,
    int? qty,
    int? cost,
  }) {
    return IncomeSource(
      name: name ?? this.name,
      singularIncomePerSecond: singularIncomePerSecond ?? this.singularIncomePerSecond,
      qty: qty ?? this.qty,
      cost: cost ?? this.cost,
    );
  }
}

enum IncomeSourceTitle {
  incubator,
}
