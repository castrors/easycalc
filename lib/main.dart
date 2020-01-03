import 'package:easycalc/constants.dart';
import 'package:easycalc/core/bloc/investment_bloc.dart';
import 'package:easycalc/locator.dart';
import 'package:easycalc/simple_bloc_delegate.dart';
import 'package:easycalc/ui/views/investment_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  setupLocator();
  runApp(BlocProvider<InvestmentBloc>(
      create: (context) {
        return locator<InvestmentBloc>();
      },
      child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    return MaterialApp(
      title: 'EasyCalc',
      theme: ThemeData(primaryColor: Color(customGreen)),
      home: InvestmentFormView(),
    );
  }
}
