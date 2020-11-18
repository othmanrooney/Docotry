import 'package:doctory/Doctory1/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class StatrPage extends StatefulWidget {
  @override
  _StatrPageState createState() => _StatrPageState();
}
class _StatrPageState extends State<StatrPage>{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:AppBar(
        title: Text('DOCTORY'),
        centerTitle: true,
      ),
      body: Container(
        decoration:
        BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.8),
              BlendMode.dstATop),
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
          child: Expanded(
            child: Column(

              children: <Widget>[
              SizedBox(height: 15.0,),
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.lightBlue,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('assets/logo.jpg'),
                  ),
                ),

                Text('DOCTORY',style: TextStyle(fontFamily:'Bangers',
                  color: Colors.lightBlue,
                  fontSize: 50.0,),),
                SizedBox(height: 40.0),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)
                  ),
                    textColor: Colors.white,
                  color: Colors.lightBlue,
                  child: Text('START',
                    style: TextStyle(fontSize: 30.0),),
                ),
              ],
            ),
          ),
            ),
          ],
        ),
      ),
    );
  }
}
