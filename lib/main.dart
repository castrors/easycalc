import 'package:easycalc/locator.dart';
import 'package:easycalc/ui/views/investment_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    return MaterialApp(
      title: 'EasyCalc',
      home: InvestmentFormView(),
    );
  }
}
