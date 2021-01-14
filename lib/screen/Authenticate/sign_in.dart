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
  final _formkey = GlobalKey<FormState>();
  FUser _user = FUser();
  String error = '';
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
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter Email ' : null,
                    onChanged: (val) {
                      setState(() => _user.setEmail(val));
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (val) => val.isEmpty || val.length < 4
                      ? 'Enter password more than 4 digits '
                      : null,
                  onChanged: (val) {
                    setState(() => _user.setPass(val));
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic result =
                          await _authService.logInWithEmailandPassword(
                              _user.getEmail(), _user.getPass());
                      if (result == null) {
                        setState(() => error = "cradentials not match:");
                      }
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pink[400],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  error,
                  style: TextStyle(fontSize: 18.0, color: Colors.red),
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
