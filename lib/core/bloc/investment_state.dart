import 'package:easycalc/core/model/investment_response.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InvestmentState {}

class InvestmentUnilizalized extends InvestmentState {}

class InvestmentEmpty extends InvestmentState {}

class InvestmentLoading extends InvestmentState {}

class InvestmentSuccess extends InvestmentState {
  final InvestmentResponse response;
  InvestmentSuccess({@required this.response});
}

class InvestmentError extends InvestmentState {
  final String error;
  InvestmentError({@required this.error});
}
