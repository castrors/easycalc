import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/services/investment_protocol.dart';
import 'package:easycalc/extensions.dart';

class InvestmentApiClient implements InvestmentProtocol {
  Future<InvestmentResponse> performSimulation(InvestmentInput input) async {
    try {
      var dio = Dio();
      // addProxyForTesting(dio);
      Response response = await dio.get(
          'http://api-simulator-calc.easynvest.com.br/calculator/simulate' +
              '?investedAmount=${input.amount}' +
              '&index=CDI' +
              '&rate=${input.cdi}' +
              '&isTaxFree=false' +
              '&maturityDate=${input.date.formatDate('yyyy-MM-dd')}');

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return InvestmentResponse.fromJson(response.data);
      } else {
        return InvestmentResponse.empty(input, ResponseStatus.BADREQUEST);
      }
    } on DioError catch (_) {
      return InvestmentResponse.empty(input, ResponseStatus.ERROR);
    }
  }

  void addProxyForTesting(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return "PROXY 10.10.100.44:8888";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}
