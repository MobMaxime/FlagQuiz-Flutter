import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flagquiz/Utilities/utils.dart';

class game_screen extends StatefulWidget {
  final int _level;
  game_screen(this._level);
  @override
  State<StatefulWidget> createState() {
    return game_state(this._level);
  }
}

class game_state extends State<game_screen> {
  Utility utility = new Utility();
  int _level;
  game_state(this._level);
  var _minPadding = 1.0;
  int que = 0;
  var options = [];
  List totalListFlags;
  List selectionCountry;
  List countryNames;
  String correctFlag;
  String correctCountry;
  bool temp = false;
  bool visible = false;
  int guesses = 0;
  var accurate;
  int correct = 0;
  int incorrect = 0;
  bool check = false;
  List continents = ['assets/images/Africa/' , 'assets/images/Asia/', 'assets/images/Europe/', 'assets/images/North_America/', 'assets/images/Oceania/', 'assets/images/South_America/'];

  TextStyle optionStyle =
      new TextStyle(color: Colors.white, fontFamily: "AmaticSC", fontSize: 15);
  TextStyle titleStyle = new TextStyle(fontFamily: "AmaticSC", fontSize: 30);

  @override
  void initState() {
    var rng = new Random();
    for(int i=0; i<10; i++) {
      print(rng.nextInt(3));
    }
    loadImages();
  }

  void loadImages() async {
    var manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    Map manifestMap = json.decode(manifestContent);
    for(var name in continents) {
      var _images =
      manifestMap.keys.where((key) => key.contains(name));
      totalListFlags = _images.toList();
    }
    generateRandom();
  }

  void generateRandom() async {
    selectionCountry = new List();
    var rng = new Random();
    int min = 0;
    int max = totalListFlags.length - 1;
    for (int i = 1; i <= (_level * 3); i++) {
      var a = min + rng.nextInt(max - min);
      await selectionCountry.contains(totalListFlags[a]) ? i-- : selectionCountry.add(totalListFlags[a]);
    }
    correctFlag =
        selectionCountry[0 + rng.nextInt((selectionCountry.length - 0))];
    correctCountry = (correctFlag.substring(
            correctFlag.indexOf('-') + 1, correctFlag.lastIndexOf('.')))
        .replaceAll('_', ' ');
    await generateNames();
    //return selectionCountry;
  }

  void generateNames() async {
    countryNames = new List();
    for (int i = 0; i < selectionCountry.length; i++) {
      await countryNames.add((selectionCountry[i].substring(
              selectionCountry[i].indexOf('-') + 1,
              selectionCountry[i].lastIndexOf('.')))
          .replaceAll('_', ' '));
    }
    temp = true;

    que++;
    if (que > 10) {
      guesses = correct + incorrect;
      accurate = ((correct / (guesses)) * 100).toStringAsFixed(2);
      utility.showAlertDialog(context, "QUIZ OVER",
          "You made $guesses guesses. \nAccuracy - $accurate %\n\nThank you for Playing :)");
      return;
    }
    setState(() {
      check = false;
      visible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (temp) {
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
                      image: new AssetImage("assets/images/background.jpg"))),
            ), //Image container

            new Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "QUESTION  $que  OF  10",
                    style: titleStyle,
                    //textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 150.0,
                    child: Image(
                      image: AssetImage(correctFlag),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: Text(
                      "GUESS  THE  COUNTRY",
                      style: titleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4.0), child: getOptions(0)),
                  Padding(
                      padding: EdgeInsets.all(4.0),
                      child: _level > 1 ? getOptions(3) : null),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: _level > 2 ? getOptions(6) : null,
                    //child: null,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 5.0,
              right: 5.0,
              bottom: 5.0,
              child: visible
                  ? Center(
                      child: check
                          ? Text(
                              "CORRECT",
                              style: TextStyle(
                                  fontFamily: "AmaticSC",
                                  fontSize: 30,
                                  color: Colors.green),
                            )
                          : Text(
                              "INCORRECT",
                              style: TextStyle(
                                  fontFamily: "AmaticSC",
                                  fontSize: 30,
                                  color: Colors.red),
                            ),
                    ) //Center
                  : Container(),
            )
          ]) //Stack
          ); //Scaffold

    } else {
      return Container();
    }
  }

  Text choseCorrect() {}

  Row getOptions(int r) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: Color(0xFF8B0000),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              countryNames[r],
              style: optionStyle,
            ),
            onPressed: () {
              if (countryNames[r] == correctCountry) {
                setState(() {
                  visible = true;
                  check = true;
                  correct++;
                });
                const oneSec = const Duration(milliseconds: 500);
                var timer = new Timer.periodic(oneSec, (Timer t) {
                  generateRandom();
                  t.cancel();
                });
              } else
                setState(() {
                  visible = true;
                  check = false;
                  incorrect++;
                });
            },
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
              countryNames[r + 1],
              style: optionStyle,
            ),
            onPressed: () {
              if (countryNames[r + 1] == correctCountry) {
                setState(() {
                  visible = true;
                  check = true;
                  correct++;
                });

                const oneSec = const Duration(milliseconds: 500);
                var timer = new Timer.periodic(oneSec, (Timer t) {
                  generateRandom();
                  t.cancel();
                });
              } else
                setState(() {
                  visible = true;
                  check = false;
                  incorrect++;
                });
            },
          ),
        )),
        Expanded(
            child: RaisedButton(
          color: Color(0xFF8B0000),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Text(
            countryNames[r + 2],
            style: optionStyle,
          ),
          onPressed: () {
            if (countryNames[r + 2] == correctCountry) {
              setState(() {
                visible = true;
                check = true;
                correct++;
              });
              const oneSec = const Duration(milliseconds: 500);
              var timer = new Timer.periodic(oneSec, (Timer t) {
                generateRandom();
                t.cancel();
              });
            } else
              setState(() {
                visible = true;
                check = false;
                incorrect++;
              });
          },
        ))
      ],
    ); //Row

    //);
  }
}
