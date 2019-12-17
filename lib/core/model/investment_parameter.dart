class InvestmentParameter {
  double investedAmount;
  double yearlyInterestRate;
  int maturityTotalDays;
  int maturityBusinessDays;
  DateTime maturityDate;
  double rate;
  bool isTaxFree;

  InvestmentParameter(
      {this.investedAmount,
      this.yearlyInterestRate,
      this.maturityTotalDays,
      this.maturityBusinessDays,
      this.maturityDate,
      this.rate,
      this.isTaxFree});

  InvestmentParameter.fromJson(Map<String, dynamic> json) {
    investedAmount = json['investedAmount'];
    yearlyInterestRate = json['yearlyInterestRate'];
    maturityTotalDays = json['maturityTotalDays'];
    maturityBusinessDays = json['maturityBusinessDays'];
    maturityDate = DateTime.parse(json['maturityDate']);
    rate = json['rate'];
    isTaxFree = json['isTaxFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['investedAmount'] = this.investedAmount;
    data['yearlyInterestRate'] = this.yearlyInterestRate;
    data['maturityTotalDays'] = this.maturityTotalDays;
    data['maturityBusinessDays'] = this.maturityBusinessDays;
    data['maturityDate'] = this.maturityDate;
    data['rate'] = this.rate;
    data['isTaxFree'] = this.isTaxFree;
    return data;
  }
}
