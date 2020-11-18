import 'package:doctory/Doctory1/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FadeAnimation.dart';
class RigistrPage extends StatefulWidget {
  @override
  _RigistrPageState createState() => _RigistrPageState();
}
class _RigistrPageState extends State<RigistrPage> {
  int _value = 1;
  bool wedVal = false;
  int _type = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                            child:FadeAnimation(2, TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Full Name',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),

                            child:FadeAnimation(2, TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email or phone number',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                            ),),
                          Container(
                            padding: EdgeInsets.all(8.0),

                            child:FadeAnimation(2, TextField(
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
                                      DropdownMenuItem(
                                          child: Text("Other"),
                                          value: 4
                                      )
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
                                      DropdownMenuItem(
                                          child: Text("Other"),
                                          value: 4
                                      )
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

                            child:FadeAnimation(2, TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            obscureText: true,
                            ),
                            ),),
                          Container(
                            padding: EdgeInsets.all(8.0),

                            child:FadeAnimation(2, TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Retype-Password',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              obscureText: true,
                            ),
                            ),),
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
                        onPressed: (){
                          Navigator.pop(context);
                        },

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
    );
  }
}

