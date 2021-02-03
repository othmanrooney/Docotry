// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {

  group('Doctory app', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    SerializableFinder  descrep = find.byValueKey('testdesc');
    SerializableFinder  tips = find.byValueKey('tipss');


    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('create descpage',()async{
      await driver.tap(descrep);
      await driver.enterText('love');
      await driver.tap(tips);
      await driver.enterText('tipss');
    });
  });
}
