import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easycalc/core/services/investment_protocol.dart';
import 'package:easycalc/core/services/investment_repository.dart';
import 'package:easycalc/locator.dart';
import './bloc.dart';

class InvestmentBloc extends Bloc<InvestmentEvent, InvestmentState> {
  InvestmentRepository _repository = locator<InvestmentProtocol>();
  @override
  InvestmentState get initialState => InvestmentUnilizalized();

  @override
  Stream<InvestmentState> mapEventToState(
    InvestmentEvent event,
  ) async* {
    try {
      yield InvestmentLoading();
      final simulation = await _repository
          .performSimulation((event as PerformSimulation).input);
      if (simulation == null) {
        yield InvestmentEmpty();
      } else {
        yield InvestmentSuccess(response: simulation);
      }
    } catch (error) {
      yield InvestmentError(error: error.toString());
    }
  }
}
