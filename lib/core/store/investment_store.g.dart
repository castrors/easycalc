// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InvestmentStore on _InvestmentStore, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults)).value;

  final _$performSimulationFutureAtom =
      Atom(name: '_InvestmentStore.performSimulationFuture');

  @override
  ObservableFuture<InvestmentResponse> get performSimulationFuture {
    _$performSimulationFutureAtom.context
        .enforceReadPolicy(_$performSimulationFutureAtom);
    _$performSimulationFutureAtom.reportObserved();
    return super.performSimulationFuture;
  }

  @override
  set performSimulationFuture(ObservableFuture<InvestmentResponse> value) {
    _$performSimulationFutureAtom.context.conditionallyRunInAction(() {
      super.performSimulationFuture = value;
      _$performSimulationFutureAtom.reportChanged();
    }, _$performSimulationFutureAtom,
        name: '${_$performSimulationFutureAtom.name}_set');
  }

  final _$performSimulationAsyncAction = AsyncAction('performSimulation');

  @override
  Future<InvestmentResponse> performSimulation(InvestmentInput input) {
    return _$performSimulationAsyncAction
        .run(() => super.performSimulation(input));
  }
}
