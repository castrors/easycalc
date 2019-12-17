import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/services/investment_repository.dart';
import 'package:easycalc/core/viewmodels/base_model.dart';
import 'package:easycalc/core/viewmodels/view_state.dart';
import 'package:easycalc/locator.dart';

class InvestmentModel extends BaseModel {
  InvestmentRepository _repository = locator<InvestmentRepository>();

  InvestmentResponse response;

  Future performSimulation(InvestmentInput input) async {
    setState(ViewState.Busy);
    response = await _repository.performSimulation(input);
    setState(ViewState.Idle);
  }
}
