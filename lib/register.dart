import 'package:flutterfirebase/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';


class RegisterPage extends StatefulWidget {
  

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final _formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final auth = FirebaseAuth.instance;


  Widget build(BuildContext context) {
    return Scaffold(
      body : Form(
      key : _formstate,
      child: ListView(
        children: <Widget>[
          buildEmailField(),
          buildPasswordField(),
          buildResgisterButton()
        ],
      ),
      )
    );
  }

RaisedButton buildResgisterButton(){
  return RaisedButton(
    child: Text('Register'),
    onPressed: () async {
      print('Regis new Account');
      if(this._formstate.currentState.validate()) print(this.email.text);
      print(this.password.text);
      FirebaseUser user = await auth.createUserWithEmailAndPassword(email: 
     this.email.text.trim() , password: this.password.text.trim(),
     );
     user.sendEmailVerification();
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), ModalRoute.withName('/'));
    },
  );
}

TextFormField buildPasswordField(){
  return TextFormField(
    controller: password,
    validator: (value) {
      if (value.length < 8)
        return 'Please Enter more than 8 Character';
      else 
        return null;  
    },
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Password',
                                  icon: Icon(Icons.lock),
                                ),
  );
  }

  TextFormField buildEmailField(){
    return TextFormField(controller: email,
    validator: (value) {
      if (value.isEmpty)
        return 'please fill in E-mail field';
      else 
        return null;
    },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(icon: Icon(Icons.email),
                    labelText: 'E-mail',
                    hintText: 'x@x.com'),
    );
  }
  

}



