import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  TextStyle buttonStyle =
      new TextStyle(color: Colors.white, fontFamily: "AmaticSC", fontSize: 35);

  LinearGradient buttonGradient = new LinearGradient(
    begin: Alignment.center,
    end: Alignment(0.8, 0.8),
    colors: [const Color(0xFF8B0000), const Color(0xFFDC143C)],
  );

  var _minPadding = 8.0;

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
                    image: new AssetImage("images/background.jpg"))),
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
                    child: Opacity(
                      opacity: 1.0,


                    child: RaisedButton(
                        child: Text(
                          "START QUIZ GAME",
                          style: buttonStyle,
                        ),
                        color: Color(0xff8B0000),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(50.0))), //Start Button
    ),
                  ),


                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                      child: Text(
                        "LEVEL",
                        style: buttonStyle,
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                    ), //Level Button
                  ),

                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                      child: Text(
                        "ABOUT US",
                        style: buttonStyle,
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                    ), //About Button
                  ),

                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                      child: Text(
                        "RATE US",
                        style: buttonStyle,
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                    ), //Rate Button
                  ),

                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                      child: Text(
                        "SHARE",
                        style: buttonStyle,
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                    ), //Share Button
                  ),

                  Padding(
                    padding: EdgeInsets.all(_minPadding),
                    child: RaisedButton(
                      child: Text(
                        "EXIT",
                        style: buttonStyle,
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                    ), //Exit Button
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
