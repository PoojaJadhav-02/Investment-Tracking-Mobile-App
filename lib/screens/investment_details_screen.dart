import 'package:flutter/material.dart';
import '../models/investment_model.dart';

class InvestmentDetailsScreen extends StatelessWidget {
  final Investment investment;

  const InvestmentDetailsScreen({Key? key, required this.investment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(investment.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Investment Name: ${investment.name}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
                "Amount Invested: \$${investment.initialAmount.toStringAsFixed(2)}"),
            Text(
                "Current Value: \$${investment.currentValue.toStringAsFixed(2)}"),
            Text(
              "Growth: ${investment.percentageGrowth.toStringAsFixed(2)}%",
              style: TextStyle(
                  color: investment.percentageGrowth >= 0
                      ? Colors.green
                      : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
