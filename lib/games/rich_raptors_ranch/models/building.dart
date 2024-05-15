class RRRBuilding {
  final ProductionType productionType;
  final IncomeQuantity incomeQuantity;

  RRRBuilding({required this.productionType, required this.incomeQuantity});
}

enum ProductionType {
  herbivoreFood,
  carnivoreFood,
}

enum IncomeQuantity {
  low,
  med,
  high;
}