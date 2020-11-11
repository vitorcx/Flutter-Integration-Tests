import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App exemplo de contador com SharedPreferences', () {
    final counterTextFinder = find.byValueKey('counterText');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    setUp(() async {
      //reinicia driver a cada teste
      driver.close();
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Inicia com 0', () async {
      expect(await driver.getText(counterTextFinder), 'Button tapped 0 times');
    });

    test('Incrementa contador', () async {
      await driver.tap(buttonFinder);
      expect(await driver.getText(counterTextFinder), 'Button tapped 1 times');
    });

    test('Testa persistencia', () async {
      expect(await driver.getText(counterTextFinder), 'Button tapped 1 times');
    });
  });
}
