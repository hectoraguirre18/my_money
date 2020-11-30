import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('My money app', () {

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDown(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Given app is running when entering about screen then title exists', () async {

      final text = find.text('ABOUT');

      expect(await driver.getText(text), 'ABOUT');
    });
  });
}
