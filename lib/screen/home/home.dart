import 'package:coffe_app_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Coffe App'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('LogOut'),
            onPressed: () async {
              await _authService.logOut();
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.brown[50],
      ),
    );
  }
}
