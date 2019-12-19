import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/viewmodels/investment_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easycalc/constants.dart';

class InvestmentDetailError extends StatelessWidget {
  final InvestmentModel model;
  final IconData icon;
  final String errorMessage;
  InvestmentDetailError(this.model, this.icon, this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Ops, algo de errado aconteceu...',
                  textAlign: TextAlign.center, style: GoogleFonts.roboto()),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 48,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
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
                  'Tentar novamente',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                onPressed: () {
                  var param = model.response.investmentParameter;
                  var input = InvestmentInput(
                      amount: param.investedAmount,
                      date: param.maturityDate,
                      cdi: param.rate.toInt());
                  model.performSimulation(input);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
