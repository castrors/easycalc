import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/services/investment_repository.dart';
import 'package:easycalc/locator.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'investment_store.g.dart';

// This is the class used by rest of your codebase
class InvestmentStore = _InvestmentStore with _$InvestmentStore;

// The store-class
abstract class _InvestmentStore with Store {
  InvestmentRepository repository = locator<InvestmentRepository>();

  InvestmentInput investmentInput;
  InvestmentResponse investment;

  @observable
  ObservableFuture<InvestmentResponse> performSimulationFuture = emptyResponse;

  @computed
  bool get hasResults =>
      performSimulationFuture != emptyResponse &&
      performSimulationFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<InvestmentResponse> emptyResponse =
      ObservableFuture.value(InvestmentResponse());

  @action
  Future<InvestmentResponse> performSimulation(InvestmentInput input) async {
    investmentInput = input;
    final future = repository.performSimulation(input);
    performSimulationFuture = ObservableFuture(future);

    return investment = await future;
  }
}
