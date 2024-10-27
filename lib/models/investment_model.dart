class Investment {
  final String name;
  final double initialAmount;
  final double currentValue;

  Investment({
    required this.name,
    required this.initialAmount,
    required this.currentValue,
  });

  double get percentageGrowth =>
      ((currentValue - initialAmount) / initialAmount) * 100;
}
