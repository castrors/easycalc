import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/services/investment_repository.dart';
import 'package:easycalc/core/store/investment_store.dart';
import 'package:easycalc/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../fakes/investment_response_success_fake.dart';

class MockInvestmentRepository extends Mock implements InvestmentRepository {}

void main() {
  InvestmentStore store;
  MockInvestmentRepository investmentRepository;

  setUp(() {
    investmentRepository = MockInvestmentRepository();
    locator.allowReassignment = true;
    locator.registerSingleton<InvestmentRepository>(investmentRepository);
    store = InvestmentStore();
  });

  test('InvestmentStore starts with null values', () {
    expect(store.investmentInput, null);
    expect(store.investment, null);
  });

  group('Investment Mobx tests', () {
    test(
        'When perform simulation with success should have results and investment with success',
        () async {
      var input = InvestmentInput(amount: 1000, cdi: 100, date: DateTime(2020));
      when(
        investmentRepository.performSimulation(input),
      ).thenAnswer(
        (_) => Future.value(
          InvestmentResponse.fromJson(investmentResponseSuccessFake),
        ),
      );

      await store.performSimulation(input);

      expect(store.hasResults, true);
      expect(store.investment,
          InvestmentResponse.fromJson(investmentResponseSuccessFake));
    });

    test(
        'When perform simulation with empty data should have results and show empty badrequest response',
        () async {
      var input = InvestmentInput(amount: 1000, cdi: 100, date: DateTime(2020));
      when(
        investmentRepository.performSimulation(input),
      ).thenAnswer(
        (_) => Future.value(
          InvestmentResponse.empty(input, ResponseStatus.BADREQUEST),
        ),
      );

      await store.performSimulation(input);

      expect(store.hasResults, true);
      expect(store.investment,
          InvestmentResponse.empty(input, ResponseStatus.BADREQUEST));
    });
  });
}
