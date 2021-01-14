import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app_firebase/models/brew.dart';

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

  //brewlist from snapshot....
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doce) {
      return Brew(
          name: doce['name'] ?? '',
          strength: doce['strength'] ?? 0,
          sugars: doce['sugars'] ?? '');
    }).toList();
  }

  //get brews stream...
  Stream<List<Brew>> get brews {
    return brewsCollection.snapshots().map(_brewListFromSnapshot);
  }
}
