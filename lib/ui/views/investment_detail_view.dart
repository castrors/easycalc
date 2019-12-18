import 'package:easycalc/constants.dart';
import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/viewmodels/investment_model.dart';
import 'package:easycalc/core/viewmodels/view_state.dart';
import 'package:easycalc/extensions.dart';
import 'package:easycalc/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestmentDetailView extends StatelessWidget {
  final InvestmentInput input;

  InvestmentDetailView({this.input});

  @override
  Widget build(BuildContext context) {
    return BaseView<InvestmentModel>(
      onModelReady: (model) => model.performSimulation(input),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: handleViews(model),
        ),
      ),
    );
  }
}

Widget handleViews(InvestmentModel model) {
  if (model.state == ViewState.Busy) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    switch (model.response.responseStatus) {
      case ResponseStatus.SUCCESS:
        return InvestmentDetailSuccess(model.response);
        break;
      case ResponseStatus.TIMEOUT:
        return Text('TIMEOUT');
        break;
      case ResponseStatus.ERROR:
        return Text('ERROR');
        break;
      default:
        return Text('DEFAULT');
    }
  }
}

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
                  Text('Rendimento total de ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.grey.shade500))),
                  Text(response.grossAmountProfit.toMonetary(),
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Color(customGreen))))
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

class SimulationRow extends StatelessWidget {
  final String title;
  final String value;
  const SimulationRow({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: rowKeyStyle),
        Text(value, style: rowValueStyle),
      ],
    );
  }
}
