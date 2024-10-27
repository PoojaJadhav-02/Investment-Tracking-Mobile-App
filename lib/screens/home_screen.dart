import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../providers/investment_provider.dart';
import 'add_investment_screen.dart';
import 'investment_details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final investmentProvider = Provider.of<InvestmentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Investments"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: investmentProvider.investments.length,
              itemBuilder: (context, index) {
                final investment = investmentProvider.investments[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text(investment.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(
                    "Initial: \$${investment.initialAmount.toStringAsFixed(2)},"
                        " Current: \$${investment.currentValue.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                //    Get.to(() => InvestmentDetailsScreen(investment: investment));
                                  /// orr ///
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InvestmentDetailsScreen(investment: investment),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total Portfolio Value: \$${investmentProvider.totalPortfolioValue.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.blueAccent.shade100,
        tooltip: "Add Investment",
        onPressed: () async {
     //     await Get.to(() => AddInvestmentScreen());            // Getx State management
                        /// orr ///
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddInvestmentScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



// Change 1