import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/services/investment_protocol.dart';
import 'package:easycalc/core/services/investment_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../fakes/investment_response_success_fake.dart';

class MockInvestmentApi extends Mock implements InvestmentProtocol {}

void main() {
  group('Investment Model', () {
    test(
        'given request an investment amount when return status code 200 then should return success',
        () async {
      var input =
          InvestmentInput(amount: 1000.0, date: DateTime(2024), cdi: 100);
      var mockApi = MockInvestmentApi();
      var investmentRepository = InvestmentRepository(client: mockApi);

      when(mockApi.performSimulation(input)).thenAnswer(
        (_) async => InvestmentResponse.fromJson(investmentResponseSuccessFake),
      );

      var response = await investmentRepository.performSimulation(input);
      expect(response.responseStatus, ResponseStatus.SUCCESS);
    });
    test(
        'given request an investment amount when returns status code 400 then should return bad request error',
        () async {
      var input =
          InvestmentInput(amount: 1000.0, date: DateTime(2024), cdi: 100);
      var mockApi = MockInvestmentApi();
      var investmentRepository = InvestmentRepository(client: mockApi);

      when(mockApi.performSimulation(input)).thenAnswer(
        (_) async => InvestmentResponse.empty(input, ResponseStatus.BADREQUEST),
      );

      var response = await investmentRepository.performSimulation(input);
      expect(response.responseStatus, ResponseStatus.BADREQUEST);
    });

    test(
        'given request an investment amount when throws exception then should return generic error',
        () async {
      var input =
          InvestmentInput(amount: 1000.0, date: DateTime(2024), cdi: 100);
      var mockApi = MockInvestmentApi();
      var investmentRepository = InvestmentRepository(client: mockApi);

      when(mockApi.performSimulation(input)).thenAnswer(
        (_) async => InvestmentResponse.empty(input, ResponseStatus.ERROR),
      );

      var response = await investmentRepository.performSimulation(input);
      expect(response.responseStatus, ResponseStatus.ERROR);
    });
  });
}
