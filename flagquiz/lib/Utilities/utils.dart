import 'package:flutter/material.dart';

class Utility {
  TextStyle titleStyle = new TextStyle(fontFamily: "AmaticSC", fontSize: 30);
  TextStyle subTileStyle = new TextStyle(fontFamily: "AmaticSC", fontSize: 20);

  void showAlertDialog(BuildContext context, String title, String message) {
    AlertDialog alertDialog = AlertDialog(
        title: Text(
          title,
          style: titleStyle,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              message,
              style: subTileStyle,
              textAlign: TextAlign.justify,
            ),
            RawMaterialButton(
              child: Text(
                "OK",
                style: titleStyle,
              ),
              onPressed: () {
//                Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
          ],
        ));
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
