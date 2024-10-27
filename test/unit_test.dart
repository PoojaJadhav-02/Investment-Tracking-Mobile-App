import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_mobile_app/models/investment_model.dart';

void main() {
  test('Calculates correct percentage growth', () {
    final investment = Investment(name: 'Test Investment', initialAmount: 100, currentValue: 150);
    expect(investment.percentageGrowth, 50.0);
  });
}
