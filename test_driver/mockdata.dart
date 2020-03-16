import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
const apiKey = 'f5ae6ca1afb98c959dd12936c1dd5d33';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class MockClient extends Mock implements http.Client {
  static void mockdata() {
    final client = MockClient();
    var my_json = '{"main":{"temp":280,"pressure":1012},"weather":{"id":300,"main":"Drizzle"}}';
    when(client.post('$openWeatherURL?q=Kolkata&appid=$apiKey&units=metric')).thenAnswer((_) async => http.Response(my_json,200));
  }
}