import 'package:coffe_app_firebase/models/user.dart';
import 'package:coffe_app_firebase/screen/Authenticate/authenticate.dart';
import 'package:coffe_app_firebase/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FUser>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
