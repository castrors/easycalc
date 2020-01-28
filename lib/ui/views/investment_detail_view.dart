import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_response.dart';
import 'package:easycalc/core/store/investment_store.dart';
import 'package:easycalc/locator.dart';
import 'package:easycalc/ui/widgets/investment_detail_error.dart';
import 'package:easycalc/ui/widgets/investment_detail_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InvestmentDetailView extends StatelessWidget {
  final InvestmentStore store = locator<InvestmentStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (_) {
          if (!store.hasResults) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (store.investment.responseStatus == ResponseStatus.BADREQUEST) {
            return InvestmentDetailError(store.investmentInput,
                Icons.error_outline, 'Ocorreu um erro inesperado');
          }

          if (store.investment.responseStatus == ResponseStatus.ERROR) {
            return InvestmentDetailError(store.investmentInput,
                Icons.signal_wifi_off, 'Verifique sua conexão');
          }

          return InvestmentDetailSuccess(store.investment);
        }),
      ),
    );
  }
}
