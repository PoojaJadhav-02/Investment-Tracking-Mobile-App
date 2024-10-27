import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/investment_model.dart';

class InvestmentProvider with ChangeNotifier {
  List<Investment> _investments = [];

  List<Investment> get investments => _investments;

  double get totalPortfolioValue =>
      _investments.fold(0, (sum, item) => sum + item.currentValue);

  Future<void> loadInvestments() async {
    final prefs = await SharedPreferences.getInstance();
    final investmentData = prefs.getString("investments");
    if (investmentData != null) {
      final List decodedData = json.decode(investmentData);
      _investments = decodedData.map((item) => Investment(
                name: item["name"],
                initialAmount: item["initialAmount"],
                currentValue: item["currentValue"],
              )).toList();
      notifyListeners();
    }
  }

  Future<void> addInvestment(Investment investment) async {
    _investments.add(investment);
    await saveInvestments();
    notifyListeners();
  }

  Future<void> saveInvestments() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _investments.map((investment) => {
              "name": investment.name,
              "initialAmount": investment.initialAmount,
              "currentValue": investment.currentValue,
            }).toList();
    prefs.setString("investments", json.encode(data));
  }
}
