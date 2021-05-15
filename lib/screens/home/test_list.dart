import 'package:firebase_app/models/testEntry.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class TestList extends StatefulWidget {
  const TestList({Key key}) : super(key: key);

  @override
  _TestListState createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    final tests = Provider.of<List<TestEntry>>(context);
    tests.forEach((test) {
      print(test.grade);
    });
    return Container();
  }
}
