import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/viewmodels/investment_model.dart';
import 'package:easycalc/core/viewmodels/view_state.dart';
import 'package:easycalc/extensions.dart';
import 'package:easycalc/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class InvestmentDetailView extends StatelessWidget {
  final InvestmentInput input;

  InvestmentDetailView({this.input});

  @override
  Widget build(BuildContext context) {
    return BaseView<InvestmentModel>(
      onModelReady: (model) => model.performSimulation(input),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Resultado da simulação'),
        ),
        body: model.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Resultado da simulação',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      model.response.grossAmount.toMonetary(),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Rendimento total de ',
                          textAlign: TextAlign.center,
                        ),
                        Text(model.response.grossAmountProfit.toMonetary())
                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    SimulationRow(
                        title: 'Valor aplicado inicialmente',
                        value: model.response.investmentParameter.investedAmount
                            .toMonetary()),
                    SimulationRow(
                        title: 'Valor bruto do investimento',
                        value: model.response.grossAmount.toMonetary()),
                    SimulationRow(
                        title: 'Valor do rendimento',
                        value: model.response.grossAmountProfit.toMonetary()),
                    SimulationRow(
                        title: 'IR sobre o investimento',
                        value:
                            'R\$ ${model.response.taxesAmount} (${model.response.taxesRate})'),
                    SimulationRow(
                        title: 'Valor líquido do investimento',
                        value: model.response.netAmount.toMonetary()),
                    SizedBox(
                      height: 32.0,
                    ),
                    SimulationRow(
                        title: 'Data de resgate',
                        value: model.response.investmentParameter.maturityDate
                            .formatDate('dd/MM/yyyy')),
                    SimulationRow(
                        title: 'Dias corridos',
                        value: model
                            .response.investmentParameter.maturityTotalDays
                            .toString()),
                    SimulationRow(
                        title: 'Rendimento mensal',
                        value: model.response.monthlyGrossRateProfit.toPercent()),
                    SimulationRow(
                        title: 'Percentual do CDI do investimento',
                        value: model.response.investmentParameter.rate.toPercent()),
                    SimulationRow(
                        title: 'Rentabilidade anual',
                        value:
                            model.response.investmentParameter.yearlyInterestRate.toPercent()),
                    SimulationRow(
                        title: 'Rentabilidade no período',
                        value: model.response.rateProfit.toPercent()),
                  ],
                ),
              ),
      ),
    );
  }
}

class SimulationRow extends StatelessWidget {
  final String title;
  final String value;
  const SimulationRow({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title),
        Text(value),
      ],
    );
  }
}
