import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';

void main() => runApp(MaterialApp(title: "Wheather App", home: Home()));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  var temp;
  var currently;
  var humidity;
  var windSpeed;

  Future getWeather() async {
    http.Response response = await http.get(Uri.https(
        'http://api.openweathermap.org/',
        'data/2.5/weather?q=Moscow&appid=$apiKey'));
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
    });
  }

  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text("Москва",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
              Text(temp != null ? '$temp\u00b0' : 'Loading...',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text("Погода",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text('температура'),
                    trailing: Text('13\u00b0')),
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text('weather'),
                    trailing: Text('weather')),
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text('солнышко'),
                    trailing: Text('13')),
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text('скорость ветра'),
                    trailing: Text('13')),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
