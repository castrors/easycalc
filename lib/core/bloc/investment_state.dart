import 'package:easycalc/core/model/investment_response.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class InvestmentState extends Equatable {
  const InvestmentState();

  @override
  List<Object> get props => [];
}

class InvestmentUnitialized extends InvestmentState {}

class InvestmentEmpty extends InvestmentState {}

class InvestmentLoading extends InvestmentState {}

class InvestmentSuccess extends InvestmentState {
  final InvestmentResponse response;
  InvestmentSuccess({@required this.response});

  @override
  List<Object> get props => [response];

  @override
  String toString() {
    return 'InvestmentSuccess { response: $response }';
  }
}

class InvestmentError extends InvestmentState {
  final String error;
  InvestmentError({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'InvestmentError { error: $error }';
  }
}
