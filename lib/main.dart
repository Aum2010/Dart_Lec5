



import 'package:flutter/material.dart';
import 'package:flutterfirebase/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
      return buldMaterialApp();
    }

    MaterialApp buldMaterialApp(){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: '/',
        routes: {
          '/' : (context) => LoginPage(),
          
        },
      );
    }
}
