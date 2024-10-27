
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:tracking_mobile_app/providers/investment_provider.dart';
import 'package:tracking_mobile_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => InvestmentProvider()..loadInvestments()
        ),
      ],
    //child: GetMaterialApp(                             // Getx State management
          /// orr ///
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Investment Tracker",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}




















