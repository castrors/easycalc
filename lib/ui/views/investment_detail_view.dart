import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/viewmodels/investment_model.dart';
import 'package:easycalc/core/viewmodels/view_state.dart';
import 'package:easycalc/ui/views/base_view.dart';
import 'package:easycalc/ui/widgets/investment_detail_error.dart';
import 'package:easycalc/ui/widgets/investment_detail_success.dart';
import 'package:flutter/material.dart';

class InvestmentDetailView extends StatelessWidget {
  final InvestmentInput input;

  InvestmentDetailView({this.input});

  @override
  Widget build(BuildContext context) {
    return BaseView<InvestmentModel>(
      onModelReady: (model) => model.performSimulation(input),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: handleViews(model),
        ),
      ),
    );
  }
}

Widget handleViews(InvestmentModel model) {
  if (model.state == ViewState.Busy) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    switch (model.response.responseStatus) {
      case ResponseStatus.SUCCESS:
        return InvestmentDetailSuccess(model.response);
        break;
      case ResponseStatus.BADREQUEST:
        return InvestmentDetailError(model, Icons.error_outline, 'Ocorreu um erro inesperado');
        break;
      case ResponseStatus.ERROR:
        return InvestmentDetailError(model, Icons.signal_wifi_off, 'Verifique sua conexão');
        break;
      default:
        return Text('DEFAULT');
    }
  }
}
