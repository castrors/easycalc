import 'package:easycalc/core/model/investment_input.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InvestmentEvent {}

class PerformSimulation extends InvestmentEvent {
  final InvestmentInput input;
  PerformSimulation({@required this.input});
}
