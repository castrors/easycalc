import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easycalc/constants.dart';
import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/ui/views/investment_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvestmentFormView extends StatefulWidget {
  @override
  _InvestmentFormViewState createState() => _InvestmentFormViewState();
}

class _InvestmentFormViewState extends State<InvestmentFormView> {
  final _formKey = GlobalKey<FormState>();

  var investmentInput = InvestmentInput();
  var _isAmountFilled = false;
  var _isDateFilled = false;
  var _isCDIFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                key: Key('amount'),
                decoration: InputDecoration(
                    labelText: 'Quanto você gostaria de aplicar?',
                    hintText: 'R\$'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
                onChanged: (amount) {
                  setState(() {
                    _isAmountFilled = amount.isNotEmpty;
                  });
                  investmentInput.amount = double.parse(amount);
                },
                validator: (value) {
                  if (value.isEmpty || int.parse(value) <= 0) {
                    return 'Por favor, digite o valor do investimento';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              DateTimeField(
                key: Key('date'),
                format: DateFormat('dd/MM/yyyy'),
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
                  setState(() {
                    _isDateFilled = date != null;
                  });

                  investmentInput.date = date;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                key: Key('cdi'),
                decoration: InputDecoration(
                    labelText: 'Qual o percentual do CDI do investimento?',
                    hintText: '100%'),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, selecione o percentual do CDI';
                  }
                  return null;
                },
                onChanged: (cdi) {
                  setState(() {
                    _isCDIFilled = cdi.isNotEmpty;
                  });

                  investmentInput.cdi = int.parse(cdi);
                },
              ),
              SizedBox(
                height: 16,
              ),
              ButtonTheme(
                minWidth: 300,
                height: 48,
                child: RaisedButton(
                    key: Key('submit'),
                    color: Color(customGreen),
                    child: Text(
                      'Simular',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    onPressed: _isAmountFilled && _isDateFilled && _isCDIFilled
                        ? () => _submit()
                        : null),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InvestmentDetailView(input: investmentInput)),
      );
    }
  }
}
