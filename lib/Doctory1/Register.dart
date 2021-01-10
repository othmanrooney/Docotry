import 'package:doctory/Doctory1/doctorform.dart';
import 'package:doctory/Doctory1/login.dart';
import 'package:doctory/Services/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FadeAnimation.dart';
class RigistrPage extends StatefulWidget {
  @override
  _RigistrPageState createState() => _RigistrPageState();
}
class _RigistrPageState extends State<RigistrPage> {

  //validation
  String error="";
  final _formKey=GlobalKey<FormState>();

  //Text Field state
  String email;
  String pass;
  String name;
  int age;

  int _value;
  bool wedVal = false;
  int _type ;
  final AuthServices _auth=AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
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
                            child: Text('Register',style: TextStyle(
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
                  padding: EdgeInsets.all(25.0),
                  child:Column(
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
                                    return 'Please enter Your name';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    name=val;
                                  });

                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              ),),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),

                              child:FadeAnimation(2, TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Your email';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    email=val;
                                  });

                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email or phone number',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                              ),),
                            Container(
                              padding: EdgeInsets.all(8.0),

                              child:FadeAnimation(2, TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Your Age';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    age= int.parse(val);
                                  });

                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Age',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                              ),),
                            Row(

                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),

                                  child:FadeAnimation(2, DropdownButton(

                                      value: _value,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Type",style: TextStyle(color: Colors.grey[400]),),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Doctor"),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                            child: Text("Patient"),
                                            value: 3
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      }),

                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),

                                  child:FadeAnimation(2, DropdownButton(

                                      value: _type,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Gender",style: TextStyle(color: Colors.grey[400]),),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Male"),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                            child: Text("Female"),
                                            value: 3
                                        ),

                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          _type = value;
                                        });
                                      }),

                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),

                              child:FadeAnimation(2, TextFormField(
                                validator: (value) {
                                  if (value.isEmpty&&value.length<6) {
                                    return 'Please enter Your Password greater than 6 char';
                                  }
                                  return null;
                                },

                                onChanged: (val) {
                                  setState(() {
                                    pass=val;
                                  });

                                },

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              obscureText: true,
                              ),
                              ),),
//                            Container(
//                              padding: EdgeInsets.all(8.0),
//
//                              child:FadeAnimation(2, TextField(
//                                decoration: InputDecoration(
//                                  border: InputBorder.none,
//                                  hintText: 'Retype-Password',
//                                  hintStyle: TextStyle(color: Colors.grey[400]),
//                                ),
//                                obscureText: true,
//                              ),
//                              ),),
                          ],
                        ),
                      ),

                      SizedBox(height: 50,),
                        SizedBox(width: 600.0,
                        height: 50.0,

                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),

                          ),
                          color: Colors.lightBlue,
                          child: Text('SignUP',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          onPressed: ()async{
                            if(_formKey.currentState.validate()){
                              dynamic result=await _auth.registerWithEmailandPassword(email, pass);
                             if(result==null){
                                setState(() =>_showMaterialDialog(error="please supply a valid email"));
                               }
                              print(email);
                              print(pass);

                            setState(() {
                              if(wedVal==false){
                                _showMaterialDialog("please Agree to the Terms and Conditions ");
                              }
                              if(_type==null){
                              setState(() {
                                _type=2;
                              });

                                _showMaterialDialog("The type will set to male");
                              }
                              if(_type==null){
                                setState(() {
                                  _value=3;
                                });

                                _showMaterialDialog("The type will set to Patient");
                              }
                              else{
                                print(name);
                                if(_value==2){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>docform()));
                                }
                                else
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                              }

                            });
                         } },

                        ),
                        ),
//                    Container(
//                      height: 50,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(10),
//                        color: Colors.lightBlue,
//                      ),
//                      child:Center(
//                        child: Text('SignUp',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                      ) ,
//                    ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('I agree to the Terms and Conditions?',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
                          Checkbox(
                            value: wedVal,
                            onChanged: (bool value) {
                              setState(() {
                                wedVal = value;
                              });
                            },
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
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

