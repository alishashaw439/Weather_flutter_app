import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:clima/services/networking.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:matcher/matcher.dart';



class MockClient extends Mock implements http.Client {}


   Future <void> main() async{
       var my_json = '{"main":{"temp":280.32,"pressure":1012},"weather":{"id":300,"main":"Drizzle"}}';

       var url = 'https://ulalalalaeo.com/wakawaka.json';
            test('Checks if JSON has the specified keys',()async {
                final client = MockClient();
                when(client.get(url))
                    .thenAnswer((_) async =>http.Response(my_json, 200));
                var result = await NetworkHelper(url).getData(client);

                expect(result.containsKey("main"), true); // This checks if json contains key "main"
                expect(result["main"].containsKey("temp"), true); // This checks if json[main] contains key "temp"
                expect(result["main"].containsKey("pressure"), true); // This checks if json[main] contains key "pressure"
            });













































//       test(
//                'throws an exception if the http call completes with an error', () {
               // final client = MockClient();
//
//
//                when(client.get(
//                    'https://my-json-server.typicode.com/alishashaw439/Jsondemo'))
//                    .thenAnswer((_) async => http.Response('Not Found', 404));
//
//                expect(NetworkHelper.getData(client), throwsException);
//            });

           }




//Future <void> main() async{
//
//    var abcd =await NetworkHelper('$openWeatherURL?q=kolkata&appid=$apiKey&units=metric').getData();
//    var result=jsonDecode(abcd);
//    print(result['main']['temp']);
//
//
//
//
//}