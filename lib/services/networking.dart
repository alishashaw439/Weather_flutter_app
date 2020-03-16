import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper {
  NetworkHelper(this.data);
  final String data;
  Future getData(http.Client client) async {
    http.Response response = await client.get(this.data);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);

    }

  }

}



//https://my-json-server.typicode.com/alishashaw439/Jsondemo

