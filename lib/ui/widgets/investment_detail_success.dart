import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/ui/widgets/simulation_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easycalc/extensions.dart';
import 'package:easycalc/constants.dart';

class InvestmentDetailSuccess extends StatelessWidget {
  final InvestmentResponse response;
  InvestmentDetailSuccess(this.response);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Resultado da simulação',
                  textAlign: TextAlign.center, style: GoogleFonts.roboto()),
              Text(response.grossAmount.toMonetary(),
                  textAlign: TextAlign.center, style: titleStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Rendimento total de ',
                    textAlign: TextAlign.center,
                    style: subtitleStyle
                  ),
                  Text(response.grossAmountProfit.toMonetary(),
                      style: subtitleGreenStyle)
                ],
              ),
              SizedBox(
                height: 32.0,
              ),
              SimulationRow(
                  title: 'Valor aplicado inicialmente',
                  value:
                      response.investmentParameter.investedAmount.toMonetary()),
              SimulationRow(
                  title: 'Valor bruto do investimento',
                  value: response.grossAmount.toMonetary()),
              SimulationRow(
                  title: 'Valor do rendimento',
                  value: response.grossAmountProfit.toMonetary()),
              SimulationRow(
                  title: 'IR sobre o investimento',
                  value:
                      '${response.taxesAmount.toMonetary()} (${response.taxesRate.toPercent()})'),
              SimulationRow(
                  title: 'Valor líquido do investimento',
                  value: response.netAmount.toMonetary()),
              SizedBox(
                height: 32.0,
              ),
              SimulationRow(
                  title: 'Data de resgate',
                  value: response.investmentParameter.maturityDate
                      .formatDate('dd/MM/yyyy')),
              SimulationRow(
                  title: 'Dias corridos',
                  value: response.investmentParameter.maturityTotalDays
                      .toString()),
              SimulationRow(
                  title: 'Rendimento mensal',
                  value: response.monthlyGrossRateProfit.toPercent()),
              SimulationRow(
                  title: 'Percentual do CDI do investimento',
                  value: response.investmentParameter.rate.toPercent()),
              SimulationRow(
                  title: 'Rentabilidade anual',
                  value: response.investmentParameter.yearlyInterestRate
                      .toPercent()),
              SimulationRow(
                  title: 'Rentabilidade no período',
                  value: response.rateProfit.toPercent()),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ButtonTheme(
              minWidth: 300,
              height: 48,
              child: RaisedButton(
                color: Color(customGreen),
                child: Text(
                  'Simular novamente',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
