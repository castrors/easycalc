import 'package:dio/dio.dart';
import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/extensions.dart';

abstract class InvestmentApiClient {
  Future<InvestmentResponse> performSimulation(InvestmentInput input);
}

class InvestmentApiClientImpl implements InvestmentApiClient {
  Future<InvestmentResponse> performSimulation(InvestmentInput input) async {
    Response response = await Dio().get(
        'https://api-simulator-calc.easynvest.com.br/calculator/simulate' +
            '?investedAmount=${input.amount}' +
            '&index=CDI' +
            '&rate=${input.cdi}' +
            '&isTaxFree=false' +
            '&maturityDate=${input.date.formatDate('yyyy-MM-dd')}');
    return InvestmentResponse.fromJson(response.data);
  }



}
