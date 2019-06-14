import 'package:flutter/material.dart';
import 'package:flagquiz/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: home_screen()
    );
  }


}