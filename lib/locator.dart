import 'package:easycalc/core/services/investment_api_client.dart';
import 'package:easycalc/core/services/investment_repository.dart';
import 'package:easycalc/core/store/investment_store.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<InvestmentRepository>(
      InvestmentRepository(client: InvestmentApiClient()));

  locator.registerSingleton(InvestmentStore());
}
