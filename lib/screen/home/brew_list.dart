import 'package:coffe_app_firebase/models/brew.dart';
import 'package:coffe_app_firebase/screen/home/brew_tiles.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  // BrewList({Key key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];
    //print(brews.docs);
    // brews.forEach((brew) {
    //   print(brew.name);
    //   print(brew.sugars);
    //   print(brew.strength);
    // });
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTiles(brew: brews[index]);
      },
    );
  }
}
