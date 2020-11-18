import 'package:doctory/Doctory1/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'Register.dart';
import 'SelectPart.dart';
import 'Selectpath.dart';
class login extends StatefulWidget{
  @override
  _logintState createState() => _logintState();
}
class _logintState extends State<login>{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
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
                              hintText: 'Email or Phone number',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),

                          child:FadeAnimation(2, TextField(
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
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => pathselect()),);
                      },

                    ),
                  ),
                         SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Forgot Password?',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RigistrPage()),
                          );
                        },
                        child: Text('SignUp',style: TextStyle(decorationStyle:TextDecorationStyle.solid ),),
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