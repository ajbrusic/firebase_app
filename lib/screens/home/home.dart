import 'package:firebase_app/models/testEntry.dart';
import 'package:firebase_app/screens/home/test_list.dart';
import 'package:firebase_app/screens/tabs/record.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screens/tabs/video.dart';
import 'package:firebase_app/screens/tabs/question.dart';

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TestEntry>>.value(
      value: DatabaseService().tests,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Firebase App"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
            )
          ],
        ),
        // body: TestList(),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Play the video'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Video())
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('Input the answer'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GradeQuestion())
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('record the voice'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Record())
                    );
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}
