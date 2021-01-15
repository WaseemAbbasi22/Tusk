//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app_firebase/models/brew.dart';
import 'package:coffe_app_firebase/models/user.dart';
import 'package:coffe_app_firebase/screen/home/brew_list.dart';
import 'package:coffe_app_firebase/screen/home/settings_form.dart';
import 'package:coffe_app_firebase/services/auth.dart';
import 'package:coffe_app_firebase/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.brown[50],
              padding: EdgeInsets.symmetric(
                horizontal: 60.0,
                vertical: 20.0,
              ),
              child: FormSettings(),
            );
          });
    }

    final user = Provider.of<FUser>(context);
    String useremail = user.getEmail();
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Coffe App'),
          //centerTitle: true,
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('LogOut'),
              onPressed: () async {
                await _authService.logOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Setting'),
              onPressed: () => _showBottomSheet(),
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BrewList()),
      ),
    );
  }
}
