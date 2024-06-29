class IncomeSource {
  final IncomeSourceTitle name;
  final int singularIncome;
  final int qty;
  final int cost;
  final int clicksUntil;

  int get fullIncome => singularIncome * qty;

  const IncomeSource({
    this.clicksUntil = 0,
    required this.singularIncome,
    required this.qty,
    required this.name,
    required this.cost,
  });

  IncomeSource copyWith({
    IncomeSourceTitle? name,
    int? singularIncomePerSecond,
    int? qty,
    int? cost,
    int? clicksUntil,
  }) {
    return IncomeSource(
      name: name ?? this.name,
      singularIncome: singularIncomePerSecond ?? this.singularIncome,
      qty: qty ?? this.qty,
      cost: cost ?? this.cost,
      clicksUntil: clicksUntil ?? this.clicksUntil,
    );
  }

  int get income => singularIncome * qty;
}

enum IncomeSourceTitle {
  incubator,
  doubleIncubator,
  dinoFoodProducer,
  iguanodon,
  parasaurolophus,
  dinosaurEgg,
}
