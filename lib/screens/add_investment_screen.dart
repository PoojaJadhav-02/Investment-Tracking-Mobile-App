import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/investment_model.dart';
import '../providers/investment_provider.dart';

class AddInvestmentScreen extends StatefulWidget {
  @override
  _AddInvestmentScreenState createState() => _AddInvestmentScreenState();
}

class _AddInvestmentScreenState extends State<AddInvestmentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _initialAmountController = TextEditingController();
  final TextEditingController _currentValueController = TextEditingController();

  void _saveInvestment(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final investment = Investment(
        name: _nameController.text,
        initialAmount: double.parse(_initialAmountController.text),
        currentValue: double.parse(_currentValueController.text),
      );
      Provider.of<InvestmentProvider>(context, listen: false)
          .addInvestment(investment);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Add Investment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: "Investment Name",),           //  you can use either labelText
                validator: (value) =>
                    value!.isEmpty ? "Please enter a name" : null,
              ),
              TextFormField(
                controller: _initialAmountController,
                decoration:
                    const InputDecoration(hintText: "Amount Invested (USD)"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Please enter the initial amount" : null,
              ),
              TextFormField(
                controller: _currentValueController,
                decoration:
                    const InputDecoration(hintText: "Current Value (USD)"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Please enter the current value" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shadowColor: Colors.purpleAccent,
                  overlayColor: Colors.white,
                ),
                onPressed: () {
                  _saveInvestment(context);
                },
                child:
                    const Text("Save", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
