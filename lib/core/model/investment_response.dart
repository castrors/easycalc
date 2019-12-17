import 'package:easycalc/core/model/investment_parameter.dart';

class InvestmentResponse {
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
      {this.investmentParameter,
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
}
