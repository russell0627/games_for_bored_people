class IncomeSource {
  final IncomeSourceTitle name;
  final int singularIncome;
  final int qty;
  final int cost;
  final int secondsUntil;

  int get fullIncome => singularIncome * qty;

  const IncomeSource({
    this.secondsUntil = 0,
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
    int? secondsUntil,
  }) {
    return IncomeSource(
      name: name ?? this.name,
      singularIncome: singularIncomePerSecond ?? singularIncome,
      qty: qty ?? this.qty,
      cost: cost ?? this.cost,
      secondsUntil: secondsUntil ?? this.secondsUntil,
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
  tyrannosaurusRex,
  dinosaurEgg,
  clickIncomeUpgrade,
}
