import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flexyy/models/flexyy_user.dart';
import 'package:flexyy/models/flexyy_string.dart';

final FirebaseFirestore _database = FirebaseFirestore.instance;

class Database {
  Database._shared();
  static final shared = Database._shared();

  factory Database() {
    return shared;
  }

  // add key/value pairs inside a document  and the subCollection is going to be the path to the specified document as a list of document, collection...
  Future<bool> addOrUpdateToDatabase(
      List<String> subCollections, Map<String, Object> values) async {
    // if the listLength is even that means it ends with a collection which is impossible to add values to it so we return
    // we subtracted 1 from the listLength so that it becomes zero indexed
    final int listLength = subCollections.length - 1;
    if (listLength.isEven) {
      return false;
    } else {
      final path = accessPath(subCollections) as DocumentReference;
      await path.set(values, SetOptions(merge: true));
      return true;
    }
  }

  accessPath(List<String> subCollections) {
    final int listLength = subCollections.length;
    // here we are accessing a document , subcollections is going to be a list of collection and then document and then collection and then document ...etc
    // so a document is going to be an odd number and a collection is going to be an even number so then we can do the proper accessing function
    // if it is a document or a collection buy checking if it is even or odd
    dynamic path = _database;
    for (int i = 0; i < listLength; i++) {
      if (i.isEven) {
        path = path.collection(subCollections[i]);
      } else {
        path = path.doc(subCollections[i]);
      }
    }
    return path;
  }

  // we initialize the user folder when we create a new user
  initializeUserFolder(FlexyyUser user) async {
    await addOrUpdateToDatabase([
      usersText,
      user.userId
    ], {
      userIdText: user.userId,
      emailText: user.email,
      passwordText: user.password
    });
  }

  getData(List<String> subCollections) async {
    // if the listLength is even that means it ends with a collection so we return a list of document references
    // that are in that collection
    // we subtracted 1 from the listLength so that it becomes zero indexed
    final int listLength = subCollections.length - 1;
    if (listLength.isEven) {
      final CollectionReference collection =
          accessPath(subCollections) as CollectionReference;
      final QuerySnapshot<Object?> snapshot = await collection.get();
      // map each snapshot to get the DocumentReference out of it  and put it in a list
      final List<DocumentReference> documents = snapshot.docs
          .map((QueryDocumentSnapshot snapshot) => snapshot.reference)
          .toList();

      return documents;
    } else {
      final DocumentReference path =
          accessPath(subCollections) as DocumentReference;
      final DocumentSnapshot snapshot = await path.get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, Object?>;

        return data;
      } else {
        return null;
      }
    }
  }

  deleteData(List<String> subCollections) async {
    final int listLength = subCollections.length - 1;
    // if listLength is odd that mean it leads to a Document so we delete the document
    // else it will lead to a Collection so we dont do anything

    if (listLength.isOdd) {
      final DocumentReference path =
          accessPath(subCollections) as DocumentReference;
      await path.delete();
    }
  }
}
