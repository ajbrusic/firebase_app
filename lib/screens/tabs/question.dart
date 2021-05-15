import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradeQuestion extends StatefulWidget {
  @override
  _GradeQuestionState createState() => _GradeQuestionState();
}

class _GradeQuestionState extends State<GradeQuestion> {
  bool like;
  List<Modal> answers = List<Modal>();
  String selected = '';

  @override
  void initState() {
    answers.add(Modal(name: 'Freshman'));
    answers.add(Modal(name: 'Sophomore'));
    answers.add(Modal(name: 'Junior'));
    answers.add(Modal(name: 'Senior'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final db = DatabaseService(uid: user.uid);

    return StreamBuilder<UserData>(
      stream: db.userData,
      builder: (context, snapshot) {
        // this only updates the first time you load the widget or if selected is somehow an empty string again before submitting
        if (selected == '' && snapshot.hasData){
          selected = snapshot.data.grade;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('What grade are you in?'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
          ),
          body: Center(
            child: Container(
              child: ListView.builder(
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 1.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: _iconControl( (answers[index].name == selected)),
                          onPressed: () {
                            setState(() {
                              selected = answers[index].name;
                            });
                          },
                        ),
                        Text(
                          answers[index].name,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            label: Text("Submit"),
            shape: RoundedRectangleBorder(),
            onPressed: () {
              print(selected);
              db.updateUserData(selected);
              Navigator.pop(context);

            },
          ),
        );
      }
    );
  }

  _iconControl(bool like) {
    if (like == false) {
      return Icon(
        Icons.circle,
        color: Colors.grey,
      );
    } else {
      return Icon(
        Icons.adjust,
        color: Colors.green,
      );
    }
  }

  _setValue(){
    print(selected);
  }
}


class Modal {
  String name;

  Modal({this.name});
}