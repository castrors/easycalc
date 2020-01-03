import 'package:easycalc/core/bloc/bloc.dart';
import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/services/investment_repository.dart';
import 'package:easycalc/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../fakes/investment_response_success_fake.dart';

class MockInvestmentRepository extends Mock implements InvestmentRepository {}

void main() {
  InvestmentBloc investmentBloc;
  MockInvestmentRepository investmentRepository;

  setUp(() {
    investmentRepository = MockInvestmentRepository();
    locator.allowReassignment = true;
    locator.registerSingleton<InvestmentRepository>(investmentRepository);
    investmentBloc = InvestmentBloc();
  });

  tearDown(() {
    investmentBloc?.close();
  });

  test('Initial state is Unitialized', () {
    expect(investmentBloc.initialState, InvestmentUnitialized());
  });

  test('When bloc is closed doesnt emit new states', () {
    expectLater(
        investmentBloc, emitsInOrder([InvestmentUnitialized(), emitsDone]));
    investmentBloc.close();
  });

  group('Investment Bloc tests', () {
    test(
        'When perform simulation with success should transit from unitialized to success',
        () {
      var input = InvestmentInput(amount: 1000, cdi: 100, date: DateTime(2020));
      when(
        investmentRepository.performSimulation(input),
      ).thenAnswer(
        (_) => Future.value(
          InvestmentResponse.fromJson(investmentResponseSuccessFake),
        ),
      );

      investmentBloc.add(PerformSimulation(input: input));

      final expectedResponse = [
        InvestmentUnitialized(),
        InvestmentLoading(),
        InvestmentSuccess(
          response: InvestmentResponse.fromJson(investmentResponseSuccessFake),
        )
      ];
      expectLater(investmentBloc, emitsInOrder(expectedResponse));
    });

    test(
        'When perform simulation with empty data should transit from unitialized to empty',
        () {
      var input = InvestmentInput(amount: 1000, cdi: 100, date: DateTime(2020));
      when(
        investmentRepository.performSimulation(input),
      ).thenAnswer(
        (_) => Future.value(
          InvestmentResponse.empty(input, ResponseStatus.BADREQUEST),
        ),
      );

      investmentBloc.add(PerformSimulation(input: input));

      final expectedResponse = [
        InvestmentUnitialized(),
        InvestmentLoading(),
        InvestmentEmpty()
      ];
      expectLater(investmentBloc, emitsInOrder(expectedResponse));
    });
  });
}
