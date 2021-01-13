import 'package:coffe_app_firebase/screen/Authenticate/sign_in.dart';
import 'package:coffe_app_firebase/screen/Authenticate/sign_up.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn)
      return SignIn(toogleView: toggleView);
    else {
      return Signup(toogleView: toggleView);
    }
  }
}
