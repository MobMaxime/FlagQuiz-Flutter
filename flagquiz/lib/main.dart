import 'package:flutter/material.dart';
import 'package:flagquiz/screens/game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: game_screen(3)
    );
  }


}