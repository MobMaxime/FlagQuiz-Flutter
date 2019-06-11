import 'package:flutter/material.dart';

class game_screen extends StatefulWidget {
  final int _level;
  game_screen(this._level);
  @override
  State<StatefulWidget> createState() {
    return game_state(this._level);
  }
}

class game_state extends State<game_screen> {
  int _level;
  game_state(this._level);
  var _minPadding = 1.0;
  var que = 1;
  var options = [];

  TextStyle optionStyle =
      new TextStyle(color: Colors.white, fontFamily: "AmaticSC", fontSize: 20);
  TextStyle titleStyle = new TextStyle(fontFamily: "AmaticSC", fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "Flies The Flag",
            style: TextStyle(
                color: Colors.white, fontFamily: "AmaticSC", fontSize: 25),
          ),
          backgroundColor: Color(0xff8B0000),
        ), //AppBar

        body: Stack(children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("images/background.jpg"))),
          ), //Image container

          new Center(
            child: Column(
              children: <Widget>[
                Text(
                  "QUESTION  $que  OF  10",
                  style: titleStyle,
                  //textAlign: TextAlign.center,
                ),
                SizedBox(height: 200.0),

                Padding(
                  padding: EdgeInsets.all(_minPadding),
                  child: Text(
                    "GUESS  THE  COUNTRY",
                    style: titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),




               Padding(padding: EdgeInsets.all(4.0),
               child: _level>2 ? getOptions() : null
              //getOptions(),
               ),

                Padding(padding: EdgeInsets.all(4.0),
                  child: _level>1 ? getOptions() : null
                 //getOptions(),
                ),

                Padding(padding: EdgeInsets.all(4.0),
                  child:
                  getOptions(),
                ),


              ],
            ),
          ),
          Positioned(
            left: 5.0,
            right: 5.0,
            bottom: 5.0,
            child: Center(
              child: Text(
                "(IN)CORRECT",
                style: titleStyle,
              ),
            ),
          )
        ]) //Stack
        ); //Scaffold
  }

  List rows() {
    for (int i = 1; i <= _level; i++) {
      options.add(getOptions());
    }
    return options;
  }

  Row getOptions() {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: Color(0xFF8B0000),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              "btn",
              style: optionStyle,
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(2.0),
          child: RaisedButton(
            color: Color(0xFF8B0000),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              "btn",
              style: optionStyle,
            ),
            onPressed: () {},
          ),
        )),
        Expanded(
            child: RaisedButton(
          color: Color(0xFF8B0000),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Text(
            "btn",
            style: optionStyle,
          ),
          onPressed: () {},
        ))
      ],
    ); //Row

    //);
  }
}