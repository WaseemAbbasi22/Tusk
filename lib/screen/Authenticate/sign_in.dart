import 'package:coffe_app_firebase/models/user.dart';
import 'package:coffe_app_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;
  SignIn({this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _authService = AuthService();
  FUser _user = FUser();
  //local variable for email and password...
  // String email = '';
  // String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Sign In to Coffe App"),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign up'),
            onPressed: () {
              widget.toogleView();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(onChanged: (val) {
                  setState(() => _user.setEmail(val));
                }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => _user.setPass(val));
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  onPressed: () async {
                    print(_user.getEmail());
                    print(_user.getPass());
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pink[400],
                ),
              ],
            ),
          )),
    );
  }
}
// RaisedButton(
//           child: Text('Sign In Anon'),
//           onPressed: () async {
//             dynamic result = await _authService.signInAnon();
//             if (result == null) {
//               print("Sign in failed");
//             } else {
//               print("SignIn successful");
//               print(result.uid);
//             }
//           },
