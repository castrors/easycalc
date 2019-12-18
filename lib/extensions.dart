import 'package:intl/intl.dart';

extension FormatedDate on DateTime {
  String formatDate(String format) {
    var formatter = DateFormat(format);
    return formatter.format(this);
  }
}

extension MonetaryDouble on double {
  String toMonetary() {
    final format = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return format.format(this);
  }
}

extension PercentageDouble on double {
  String toPercent() {
    final format = NumberFormat.decimalPattern('pt_BR');
    return format.format(this) + '%';
  }
}
