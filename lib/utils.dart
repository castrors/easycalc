import 'package:intl/intl.dart';

class Utils {
  static String formatDate(DateTime date, String format){
    var formatter = DateFormat(format);
    return formatter.format(date);
  }
}