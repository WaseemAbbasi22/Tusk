import 'package:coffe_app_firebase/models/user.dart';
import 'package:coffe_app_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final Function toogleView;
  Signup({this.toogleView});
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  AuthService _authService = AuthService();
  FUser _user = FUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Sign up to Coffe App"),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
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
                    'Sign Up',
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
