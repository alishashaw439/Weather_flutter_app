// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/networking.dart';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
class MockClient extends Mock implements http.Client{}

//
//
//Future <void> main() async{
//
//
//  var url = 'https://ulalalalaeo.com/wakawaka.json';
//  test('Checks if JSON has the specified keys',()async {
//    final client = MockClient();
//    when(client.get(url))
//        .thenAnswer((_) async =>http.Response(my_json, 200));
//    var result = await NetworkHelper(url).getData(client);
//
//    expect(result["main"].containsKey("temp"), true);
//    expect(result["main"].containsKey("pressure"), true);
//  });


void main() {

  group('Weather App', () {


    final buttonFinder = find.byValueKey('gettingTheWeather');
    final textBoxFinder = find.byValueKey("entercity");
    final tempFindPlease = find.byValueKey('tempvalue');
    FlutterDriver driver;

    Future<void> tap(SerializableFinder element) async {
      await driver.tap(textBoxFinder);
    }

    Future<void> type(SerializableFinder element, String text) async {
      await tap(textBoxFinder);
      await driver.enterText(text);
    }


    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });


    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });



    test('getting the data',() async {
      final client= MockClient();

      SerializableFinder button = find.byValueKey('entercity');

      await type(button,'kolkata');
      //await tap(textBoxFinder);
      //await driver.enterText('Kolkata');
      //await tap(buttonFinder);
      driver.requestData('weatherURL');


      expect(await driver.getText(tempFindPlease),280);



    });
  });
}
