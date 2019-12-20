import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';

abstract class InvestmentProtocol {
  Future<InvestmentResponse> performSimulation(InvestmentInput input);
}
