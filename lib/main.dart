import 'package:easycalc/locator.dart';
import 'package:easycalc/ui/views/investment_form_view.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyCalc',
      theme: ThemeData(),
      home: InvestmentFormView(),
    );
  }
}
