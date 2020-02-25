



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final _formstage = GlobalKey<FormState>();
  String email;
  String password;
  final auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formstage,
        child: ListView(
          children: <Widget>[
            TextFormField(
              onSaved: (value) {
                this.email = value.trim();
                },
                validator: (value) {
                    if(value.isEmpty){
                      return 'Please fill in E-mail field';
                    }else{
                      return null;
                    }
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  icon: Icon(Icons.email),
                  hintText: 'x@x.com'
                ),
              ),
              TextFormField(
                onSaved: (value) => {
                  this.password = value.trim()
                  },
                  validator: (value) {
                    if(value.length < 8)  
                      return 'Please Enter more than 8 character';  
                    else
                      return null;   
                  },
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'PassWord',
                    icon: Icon(Icons.lock),
                  ),
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {

                    if(this._formstage.currentState.validate()){
                      print('valid');
                      this._formstage.currentState.save();
                      this.auth
                          .signInWithEmailAndPassword(email: this.email,password: this.password)
                          .then((user)  {
                            if(user.isEmailVerified){
                                Scaffold.of(this._formstage.currentContext)
                                .showSnackBar(SnackBar(content: Text('Login pass')

                                )
                              );
                            }else{
                              Scaffold.of(this._formstage.currentContext)
                              .showSnackBar(SnackBar(content: Text('Plese verify your email')));
                            }
                          }
                        ).catchError((reason) {
                          Scaffold.of(this._formstage.currentContext)
                            .showSnackBar(SnackBar(content: Text("Login or Password invalid"),));
                        });
                    }else {print('invalid form');}


                },
                ),
              RaisedButton(
                child: Text('Resister new account'),
                onPressed: () {
                  print('Go Regis page');
                },

              )
           ],
          ),
        ),
      );
      
    
  }
}