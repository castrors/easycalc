import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/services/investment_protocol.dart';
import 'package:flutter/material.dart';

class InvestmentRepository {
  final InvestmentProtocol client;
  InvestmentRepository({@required this.client}) : assert(client != null);

  Future<InvestmentResponse> performSimulation(InvestmentInput input) async {
    return await client.performSimulation(input);
  }
}
