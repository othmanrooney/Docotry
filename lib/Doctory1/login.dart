import 'dart:async';
import 'dart:core';
import 'package:doctory/Doctory1/FadeAnimation.dart';
import 'package:doctory/Services/Auth.dart';
import 'package:doctory/module/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Register.dart';
import 'Selectpath.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin page.dart';

class login extends StatefulWidget{
  @override
  _logintState createState() => _logintState();
}

class _logintState extends State<login>{


  //validation
  final _formKey=GlobalKey<FormState>();
  String error="";
  bool showSpinner = false;
  //Text Field state
  String email;
  String pass;
  final AuthServices _auth= AuthServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<TheUser>(context);
    print(user);
    Firebase.initializeApp();
    if(FirebaseAuth.instance.currentUser==null){
      return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                        image:DecorationImage(
                          image: AssetImage('assets/background12.png'),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 60,
                          height: 130,
                          child:FadeAnimation(1, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/light-1.png'),
                                )
                            ),
                          ),),
                        ),
                        Positioned(
                          left: 120,
                          width: 50,
                          height: 110,
                          child:FadeAnimation(1.5, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/light-2.png'),
                                )
                            ),
                          ),),
                        ),
                        Positioned(
                          left: 250,
                          top: 5,
                          width: 55,
                          height: 150,
                          child:FadeAnimation(1.7, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/clock.png'),
                                )
                            ),
                          ),),
                        ),
                        Positioned(
                          child:FadeAnimation(2, Container(
                            margin: EdgeInsets.only(top: 50),
                            child:Center(
                              child: Text('Login',style: TextStyle(
                                  color: Colors.white,fontSize: 40,
                                  fontWeight:FontWeight.bold
                              ),),
                            ),
                          ),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child:Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding:EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color:Colors.lightBlue,
                                    blurRadius: 20.0,
                                    offset: Offset(0,10),

                                  ),
                                ]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100])),
                                  ),
                                  child:FadeAnimation(2, TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter Your email';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        email=value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email ',
                                      hintStyle: TextStyle(color: Colors.grey[400]),

                                    ),
                                  ),),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),

                                  child:FadeAnimation(2, TextFormField(
                                    validator: (value) {
                                      if (value.length<6&&value.isEmpty) {
                                        return 'Please enter Your Password greater than 6 char';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        pass=value;
                                      });
                                    },
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscureText:true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                    ),
                                  ),
                                  ),),
                              ],
                            ),
                          ),
                          SizedBox(height: 35),
                          SizedBox(width: 600.0,
                            height: 50.0,

                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),

                                ),
                                color: Colors.lightBlue,
                                child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                onPressed:()async {
                                  if (_formKey.currentState.validate()) {
                                    // final SharedPreferences sharedPref=await SharedPreferences.getInstance();
                                    // sharedPref.setString('email', email);
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>pathselect()));
                                    dynamic result = await _auth
                                        .signinWithEmailandPassword(email, pass);

                                    if (result == null) {
                                      setState(() =>
                                          _showMaterialDialog(error =
                                          "please supply a valid email or Re-connect"));
                                    }
                                    else {
                                      if(email.toString()=="o@gmail.com" && pass=="123456789"){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>admin()));
                                      }
                                      else
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>pathselect()));
                                    }

                                  }
                                }),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('New User ?'),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RigistrPage()),
                                  );
                                },
                                child: Text('SignUp',style: TextStyle(color: Colors.lightBlue,decorationStyle:TextDecorationStyle.solid ,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
   else {
     return pathselect();
    }

  }
  _showMaterialDialog(val) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title:RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: val,style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold,fontSize: 25),
                ),
                WidgetSpan(
                  child: Icon(Icons.error_outline, size: 30),
                ),

              ],
            ),
          ),
          content: new Text("Missing Info!",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          actions: <Widget>[
            FlatButton(
              child: Text('Close me!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}