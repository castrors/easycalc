import 'package:dio/dio.dart';
import 'package:easycalc/core/model/investment_input.dart';

abstract class InvestmentApiProtocol {
  Future<Response> performSimulation(InvestmentInput input);
}
