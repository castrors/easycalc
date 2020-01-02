import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Test Driver', () {
    final amountFinder = find.byValueKey('amount');
    final dateFinder = find.byValueKey('date');
    final cdiFinder = find.byValueKey('cdi');
    final submitFinder = find.byValueKey('submit');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test('fill the form and perform request', () async {
      await driver.tap(amountFinder);
      await driver.enterText('1000');
      await driver.tap(dateFinder);
      await driver.tap(find.text('OK'));
      await driver.tap(cdiFinder);
      await driver.enterText('100');

      await driver.waitFor(submitFinder);
      await driver.tap(submitFinder);
      await driver.waitFor(find.text('Resultado da simulação'));
      
    });

    // test('fill the form with error and perform request should show amount error', () async {
    //   await driver.tap(amountFinder);
    //   await driver.enterText('-1000');
    //   await driver.tap(dateFinder);
    //   await driver.tap(find.text('OK'));
    //   await driver.tap(cdiFinder);
    //   await driver.enterText('100');

    //   await driver.waitFor(submitFinder);
    //   await driver.tap(submitFinder);
    //   await driver.waitFor(find.text('Por favor, digite o valor do investimento'));
      
    // });
  });
}
