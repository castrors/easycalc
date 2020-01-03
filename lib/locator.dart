import 'package:easycalc/core/bloc/investment_bloc.dart';
import 'package:easycalc/core/services/investment_api_client.dart';
import 'package:easycalc/core/services/investment_protocol.dart';
import 'package:easycalc/core/services/investment_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<InvestmentProtocol>(
      () => InvestmentRepository(client: InvestmentApiClient()));

  locator.registerFactory(() => InvestmentBloc());

}
