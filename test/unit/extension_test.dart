import 'package:flutter_test/flutter_test.dart';
import 'package:easycalc/extensions.dart';

void main() {
  group('Test some extensions', () {
    test('given a DateTime when uses formatDate using dd/MM/yyyy format should return a formatted string', () {
      var date = DateTime(2019, 12, 19);
      expect(date.formatDate('dd/MM/yyyy'), '19/12/2019');
    });

    test('given a DateTime when uses formatDate using yyyy format should return a formatted string', () {
      var date = DateTime(2019, 12, 19);
      expect(date.formatDate('yyyy'), '2019');
    });

    test('given a double 1000.0 when uses toMonetary should return a formatted monetary string ', () {
      expect(1000.0.toMonetary(), 'R\$ 1.000,00');
    });

    test('given a double 100.0 when uses toMonetary should return a formatted monetary string ', () {
      expect(100.0.toMonetary(), 'R\$ 100,00');
    });

    test('given a double 1000 when uses toPercent should return a formatted percentage string ', () {
      expect(1000.0.toPercent(), '1.000%');
    });

    test('given a double 100 when uses toPercent should return a formatted percentage string ', () {
      expect(100.0.toPercent(), '100%');
    });
  });
}
