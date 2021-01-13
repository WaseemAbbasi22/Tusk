import 'package:coffe_app_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Coffe App"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: RaisedButton(
          child: Text('Sign In Anon'),
          onPressed: () async {
            dynamic result = await _authService.signInAnon();
            if (result == null) {
              print("Sign in failed");
            } else {
              print("SignIn successful");
              print(result);
            }
          },
        ),
      ),
    );
  }
}
