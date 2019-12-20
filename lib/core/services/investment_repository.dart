import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/services/investment_api_protocol.dart';
import 'package:easycalc/core/services/investment_protocol.dart';
import 'package:flutter/material.dart';

class InvestmentRepository implements InvestmentProtocol {
  final InvestmentApiProtocol client;
  InvestmentRepository({@required this.client}) : assert(client != null);

  Future<InvestmentResponse> performSimulation(InvestmentInput input) async {
    var response = await client.performSimulation(input);

    if (response == null) {
      return InvestmentResponse.empty(input, ResponseStatus.ERROR);
    } else if (response.statusCode >= 200 && response.statusCode <= 299) {
      return InvestmentResponse.fromJson(response.data);
    } else {
      return InvestmentResponse.empty(input, ResponseStatus.BADREQUEST);
    }
  }
}
