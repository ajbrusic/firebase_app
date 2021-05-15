import 'dart:async';

import 'package:flutter/material.dart';

class Record extends StatefulWidget {
  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {

  String title = "Press to record";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          color: Colors.green,
          padding: EdgeInsets.all(70),
          child: Text("Record"),
          onHighlightChanged: (value) {
            if(value) {
              print("recording");
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            }
          },
        ),
      ),
    );
  }
}


Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Recording submitted'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Would you like to submit this recording?"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Submit'),
      ),
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Colors.red[500],
        child: const Text('Never Mind'),
      ),
    ],
  );
}