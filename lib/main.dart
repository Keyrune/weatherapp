import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: "Wheather App", home: Home()));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
