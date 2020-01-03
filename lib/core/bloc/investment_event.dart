import 'package:easycalc/core/model/investment_input.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InvestmentEvent extends Equatable {
  const InvestmentEvent();

  @override
  List<Object> get props => [];
}

class PerformSimulation extends InvestmentEvent {
  final InvestmentInput input;
  PerformSimulation({this.input});

  @override
  List<Object> get props => [input];

  @override
  String toString() => 'PerformSimulation { input: $input}';
}
