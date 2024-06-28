import '../models/income_source.dart';

const Map<IncomeSourceTitle, IncomeSource> allIncomeSources = {
  IncomeSourceTitle.incubator: IncomeSource(
    singularIncomePerSecond: 1,
    qty: 0,
    name: IncomeSourceTitle.incubator,
    cost: 10,
  ),
};
