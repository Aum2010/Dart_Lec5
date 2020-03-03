import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title: Text('Firebase Authen App',
        style: TextStyle(color: Colors.white)),
        ),
          body: Container(child: Center(child: Column(mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Hello', style: TextStyle(fontSize: 26),)
            ],),),),
    );
  }
}