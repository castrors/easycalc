import 'package:easycalc/core/bloc/bloc.dart';
import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/locator.dart';
import 'package:easycalc/ui/widgets/investment_detail_error.dart';
import 'package:easycalc/ui/widgets/investment_detail_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvestmentDetailView extends StatelessWidget {
  final InvestmentInput input;

  InvestmentDetailView({this.input});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<InvestmentBloc, InvestmentState>(
            bloc: locator<InvestmentBloc>()
              ..add(PerformSimulation(input: input)),
            builder: (context, state) {
              if (state is InvestmentSuccess) {
                return InvestmentDetailSuccess(state.response);
              } else if (state is InvestmentEmpty) {
                return InvestmentDetailError(
                    input, Icons.error_outline, 'Ocorreu um erro inesperado');
              } else if (state is InvestmentError) {
                return InvestmentDetailError(
                    input, Icons.signal_wifi_off, 'Verifique sua conexão');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
