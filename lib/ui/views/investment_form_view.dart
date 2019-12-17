import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/ui/views/investment_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvestmentFormView extends StatelessWidget {
  var investmentInput = InvestmentInput();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulação de investimento'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Quanto você gostaria de aplicar?',
                    hintText: 'R\$'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
                onChanged: (amount) {
                  investmentInput.amount = double.parse(amount);
                },
              ),
              DateTimeField(
                format: DateFormat("dd/MM/yyyy"),
                decoration: InputDecoration(
                    labelText: 'Qual a data de vencimento do investimento?',
                    hintText: 'dia/mês/ano'),
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.next,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2200));
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione a data de vencimento';
                  }
                  return null;
                },
                onChanged: (date) {
                  investmentInput.date = date;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Qual o percentual do CDI do investimento?',
                    hintText: '100%'),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: (cdi) {
                  investmentInput.cdi = int.parse(cdi);
                },
              ),
              RaisedButton(
                child: Text('Calcular'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InvestmentDetailView(input: investmentInput)),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
