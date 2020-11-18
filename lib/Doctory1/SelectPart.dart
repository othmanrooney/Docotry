import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Head-Docotr.dart';

class SelectPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Hero(
        tag: 'select2',

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage('assets/selectpage.png'),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
              Text('Where is Your pain',style: TextStyle(fontSize: 30.0,color: Colors.white,decoration: TextDecoration.none),),
              SizedBox(height:MediaQuery.of(context).size.height/26,
                child: Container(color: Colors.transparent,),),
              SizedBox(width:MediaQuery.of(context).size.width*0.3,height:MediaQuery.of(context).size.height*0.2,
                child:  GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HeadDocotor()));
                  },
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.192, width:MediaQuery.of(context).size.width*0.1,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Container(
                    width: 5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.12,width: 75.0,
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Container(
                    width: 10.0,
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.192, width:MediaQuery.of(context).size.width*0.1,
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/2.4,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.2,height:MediaQuery.of(context).size.height/14,
                    child: GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.39,
                  ),
                  SizedBox(
                    width: 30.0,height: 90.0,
                    child: GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Container(
                    width: 30.0,
                  ),
                  SizedBox(
                    width: 30.0,height: 90.0,
                    child: GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:MediaQuery.of(context).size.height/25,),
              Row(
                children: <Widget>[
                  RaisedButton.icon(onPressed: () {
                    Navigator.pop(context);
                  },
                    icon:
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    label: Text('Back',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.lightBlue,
                    splashColor:Colors.cyan,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );


  }
}
