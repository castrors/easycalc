import 'package:equatable/equatable.dart';

class InvestmentInput implements Equatable {
  double amount;
  DateTime date;
  int cdi;

  InvestmentInput({this.amount, this.date, this.cdi});

  @override
  List<Object> get props => [amount, date, cdi];
}
