import 'package:flutter/material.dart';
import 'package:flagquiz/screens/game_screen.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:flagquiz/Utilities/utils.dart';

class home_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return home_state();
  }
}

class home_state extends State<home_screen> {
  TextStyle buttonStyle =
      new TextStyle(color: Colors.white, fontFamily: "AmaticSC", fontSize: 35);
  TextStyle titleStyle = new TextStyle(fontFamily: "AmaticSC", fontSize: 30);
  TextStyle subTileStyle = new TextStyle(fontFamily: "AmaticSC", fontSize: 25);

  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  }

  var _minPadding = 8.0;
  Color buttonColor = new Color(0xff8B0000);
  var _level = 1;
  String aboutUs = "Mobmaxime is an established Web and Mobile Application Development Company delivering Xamarin, Appcelerator, Native android and iOS applications. www.mobmaxime.com\n";
  Utility utility = new Utility();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flags Quiz",
          style: TextStyle(
              color: Colors.white, fontFamily: "AmaticSC", fontSize: 25),
        ),
        backgroundColor: Color(0xff8B0000),
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/images/background.jpg"))),
          ), //Image container

          Padding(
            padding: EdgeInsets.all(20.0),
            child: new Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 60.0,
                  ), //Container

                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                        child: Text(
                          "START QUIZ GAME",
                          style: buttonStyle,
                        ),
                        color: buttonColor,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => game_screen(_level)));
                        }), //Start Button
                  ),

                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                      child: Text(
                        "LEVELS",
                        style: buttonStyle,
                      ),
                      color: buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                              title: Text("Levels", style: titleStyle),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    child: ListView(
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          ListTile(
                                            title: Text(
                                              "Easy",
                                              style: subTileStyle,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _level = 1;
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                          ListTile(
                                            title: Text(
                                              "Medium",
                                              style: subTileStyle,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _level = 2;
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                          ListTile(
                                            title: Text(
                                              "Difficult",
                                              style: subTileStyle,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _level = 3;
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                        ]) //ListView
                                    ,
                                  ), //Container
                                ],
                              ) //Column
                              ),
                        );
                      },
                    ), //Level Button
                  ),

                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                        child: Text(
                          "ABOUT US",
                          style: buttonStyle,
                        ),
                        color: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        onPressed: () {
                            utility.showAlertDialog(context, "ABOUT MOBMAXIME", aboutUs);
                        }), //About Button
                  ),

                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                        child: Text(
                          "SHARE",
                          style: buttonStyle,
                        ),
                        color: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        onPressed: () {
                          Share.share(
                              "Check out the Flags Quiz Game. \nGuess which Country FLIES THE FLAG and check your accuracy!\n https://github.com/MobMaxime/FlagQuiz-Flutter ");
                        }), //Share Button
                  ),

                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                        child: Text(
                          "EXIT",
                          style: buttonStyle,
                        ),
                        color: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        onPressed: () {
                          SystemNavigator.pop();
                        }), //Exit Button
                  ),
                ],
              ),
            ) //Center
            ,
          )
        ],
      ),
    );
  }
}
