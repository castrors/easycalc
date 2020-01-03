import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/services/investment_repository.dart';
import 'package:easycalc/locator.dart';
import './bloc.dart';

class InvestmentBloc extends Bloc<InvestmentEvent, InvestmentState> {
  InvestmentRepository _repository = locator<InvestmentRepository>();

  @override
  InvestmentState get initialState => InvestmentUnitialized();

  @override
  Stream<InvestmentState> mapEventToState(
    InvestmentEvent event,
  ) async* {
    yield InvestmentLoading();
    final simulation =
        await _repository.performSimulation((event as PerformSimulation).input);
    if (simulation.responseStatus == ResponseStatus.BADREQUEST) {
      yield InvestmentEmpty();
    } else if (simulation.responseStatus == ResponseStatus.SUCCESS) {
      yield InvestmentSuccess(response: simulation);
    } else {
      yield InvestmentError(error: 'error');
    }
  }
}
