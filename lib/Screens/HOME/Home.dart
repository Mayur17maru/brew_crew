import 'package:brew_crew/Model/User.dart';
import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<QuerySnapshot>.value(
      value: DataBaseServices(uid: '').brus,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[90],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(onPressed: () async {
              await _auth.signout();
            },
            icon:Icon(Icons.person,color: Colors.white,),
            label: Text('Sign Out',style: TextStyle(color: Colors.white),),)
          ],
        ),
      ),
    );
  }
}
