import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection references....
  final CollectionReference brewsCollection =
      FirebaseFirestore.instance.collection("brews");
//creae document and updateuserdata...
  Future updateUserData(String sugers, String name, int strength) async {
    return await brewsCollection
        .doc(uid)
        .set({'sugars': sugers, 'name': name, 'strength': strength});
  }
}
