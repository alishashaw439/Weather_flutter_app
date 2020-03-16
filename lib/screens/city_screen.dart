import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
const popResultButtonKey = Key('popWithResult');
class CityScreen extends StatefulWidget {


  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(

            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            //git remote set-url origin https://github.com/alishashaw439/xylophone.git
            //
            //‍
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  key: popResultButtonKey,
                  onPressed: () {
                    Navigator.pop(context,'i am depressed');
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    key: Key('entercity'),
                    style: TextStyle(

                      color: Colors.black,
                    ),
                    decoration: kInputFieldDecoration,
                    onChanged: (value) {
                      cityName = value;
                    }),
              ),
              FlatButton(
                key:Key('gettingTheWeather'),
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
