import 'package:easycalc/core/model/investment_input.dart';
import 'package:easycalc/core/model/investment_parameter.dart';

enum ResponseStatus { SUCCESS, BADREQUEST, ERROR }

class InvestmentResponse {
  ResponseStatus responseStatus;
  InvestmentParameter investmentParameter;
  double grossAmount;
  double taxesAmount;
  double netAmount;
  double grossAmountProfit;
  double netAmountProfit;
  double annualGrossRateProfit;
  double monthlyGrossRateProfit;
  double dailyGrossRateProfit;
  double taxesRate;
  double rateProfit;
  double annualNetRateProfit;

  InvestmentResponse(
      {this.responseStatus,
      this.investmentParameter,
      this.grossAmount,
      this.taxesAmount,
      this.netAmount,
      this.grossAmountProfit,
      this.netAmountProfit,
      this.annualGrossRateProfit,
      this.monthlyGrossRateProfit,
      this.dailyGrossRateProfit,
      this.taxesRate,
      this.rateProfit,
      this.annualNetRateProfit});

  InvestmentResponse.fromJson(Map<String, dynamic> json) {
    responseStatus = ResponseStatus.SUCCESS;
    investmentParameter = json['investmentParameter'] != null
        ? new InvestmentParameter.fromJson(json['investmentParameter'])
        : null;
    grossAmount = json['grossAmount'];
    taxesAmount = json['taxesAmount'];
    netAmount = json['netAmount'];
    grossAmountProfit = json['grossAmountProfit'];
    netAmountProfit = json['netAmountProfit'];
    annualGrossRateProfit = json['annualGrossRateProfit'];
    monthlyGrossRateProfit = json['monthlyGrossRateProfit'];
    dailyGrossRateProfit = json['dailyGrossRateProfit'];
    taxesRate = json['taxesRate'];
    rateProfit = json['rateProfit'];
    annualNetRateProfit = json['annualNetRateProfit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.investmentParameter != null) {
      data['investmentParameter'] = this.investmentParameter.toJson();
    }
    data['grossAmount'] = this.grossAmount;
    data['taxesAmount'] = this.taxesAmount;
    data['netAmount'] = this.netAmount;
    data['grossAmountProfit'] = this.grossAmountProfit;
    data['netAmountProfit'] = this.netAmountProfit;
    data['annualGrossRateProfit'] = this.annualGrossRateProfit;
    data['monthlyGrossRateProfit'] = this.monthlyGrossRateProfit;
    data['dailyGrossRateProfit'] = this.dailyGrossRateProfit;
    data['taxesRate'] = this.taxesRate;
    data['rateProfit'] = this.rateProfit;
    data['annualNetRateProfit'] = this.annualNetRateProfit;
    return data;
  }

  static InvestmentResponse empty(InvestmentInput input, ResponseStatus status) {
    return InvestmentResponse(
      responseStatus: status,
      investmentParameter: InvestmentParameter(
          investedAmount: input.amount,
          isTaxFree: false,
          maturityBusinessDays: 0,
          maturityDate: input.date,
          maturityTotalDays: 0,
          rate: input.cdi.toDouble(),
          yearlyInterestRate: 0.0),
      annualGrossRateProfit: 0.0,
      annualNetRateProfit: 0.0,
      dailyGrossRateProfit: 0.0,
      grossAmount: 0.0,
      grossAmountProfit: 0.0,
      monthlyGrossRateProfit: 0.0,
      netAmount: 0.0,
      netAmountProfit: 0.0,
      rateProfit: 0.0,
      taxesAmount: 0.0,
      taxesRate: 0.0,
    );
  }
}
