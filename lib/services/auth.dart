import 'package:coffe_app_firebase/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //FirebaseAuth _auth = Firebase
  FirebaseAuth _auth = FirebaseAuth.instance;

  //Modify firebase user to our custom user.....
  FUser _userFromFirebase(User user) {
    return user != null ? FUser(uid: user.uid) : null;
  }

  //auth change user Stream...
  Stream<FUser> get fuser {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
    //.map(_userFromFirebase);
  }

//signIn annon...
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //SignIn with email and password....
  Future logInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email and password...
  Future registerWithEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //LogOut .....
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
