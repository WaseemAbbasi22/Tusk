import 'package:coffe_app_firebase/models/user.dart';
import 'package:coffe_app_firebase/screen/shared/constant.dart';
import 'package:coffe_app_firebase/screen/shared/loading.dart';
import 'package:coffe_app_firebase/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormSettings extends StatefulWidget {
  FormSettings({Key key}) : super(key: key);

  @override
  _FormSettingsState createState() => _FormSettingsState();
}

class _FormSettingsState extends State<FormSettings> {
  List<String> sugers = ['0', '1', '2', '3', '4'];
  final _formkey = GlobalKey<FormState>();

  String _currentSuger;
  String _currentName;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FUser>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Form(
              key: _formkey,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Update Data',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      initialValue: userData.name,
                      decoration: textInputDecoration,
                      validator: (val) =>
                          val.isEmpty ? 'please Enter Name' : null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //Dropdown
                    DropdownButtonFormField(
                      value: userData.sugers ?? _currentSuger,
                      items: sugers.map((suger) {
                        return DropdownMenuItem(
                          value: suger,
                          child: Text('$suger sugers'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => _currentSuger = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Select strength of coffe',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Slider(
                      activeColor: Colors.brown[_currentStrength ?? 100],
                      inactiveColor: Colors.brown[_currentStrength ?? 100],
                      min: 100,
                      max: 900,
                      divisions: 8,
                      value: (_currentStrength ?? 100).toDouble(),
                      onChanged: (val) =>
                          setState(() => _currentStrength = val.round()),
                    ),
                    //slider
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentSuger ?? userData.sugers,
                              _currentName ?? userData.name,
                              _currentStrength ?? userData.strength);
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
