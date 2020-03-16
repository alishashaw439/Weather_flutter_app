import 'package:flutter_driver/driver_extension.dart';
import 'package:clima/main.dart' as app;
import 'dart:async';
import 'mockdata.dart';

void main() {
  // This line enables the extension.
  Future <String> datahandler (String msg ) async{

    switch (msg) {
      case "weatherURL":
        {
          MockClient.mockdata();
        }
        break;
      default:
        break;
    }
  }
  enableFlutterDriverExtension(handler: datahandler);


  app.main();
}
