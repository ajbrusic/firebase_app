import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/testEntry.dart';
import 'package:firebase_app/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference testsCollection = FirebaseFirestore.instance.collection('testsCollection');

  Future updateUserData(String grade) async {
    return await testsCollection.doc(uid).set({
      'grade': grade
    });
  }


  //list from snapshot
  List<TestEntry> _testListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return TestEntry(
        grade: doc.get('grade') ?? '',
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      grade: snapshot.get('grade')
    );
  }

  Stream<List<TestEntry>> get tests {
    return testsCollection.snapshots()
      .map(_testListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return testsCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
}