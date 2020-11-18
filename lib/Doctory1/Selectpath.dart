import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Corona/CoronaVirus.dart';
import 'SelectPart.dart';
class pathselect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:90.0),
              child: Text('Determine Part',style: TextStyle(fontSize:35.0,color: Colors.white,decoration: TextDecoration.none,fontWeight: FontWeight.bold),),
            ),
            Row(
              children:<Widget>[
                SizedBox(width: 60.0,),
                Hero(
                    tag: 'select2',
                    child: Image.asset('assets/selectpage2.png',height:300.0,)
                ),
              ],
            ),
            Row(
              children: <Widget>[
               SizedBox(width: 100.0,),
                RaisedButton(
                  child: Text('External Medicine',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(seconds: 2),
                            pageBuilder: (_, __, ___) => SelectPart())
                    );

                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red)
                  ),
                ),
                SizedBox(width: 35.0,),
                Icon(Icons.arrow_downward,color: Colors.white,),
              ],
            ),
            SizedBox(height: 130.0,),
            Row(
              children:<Widget>[
                Image.asset('assets/JSM2.png',height:240.0,),
              ],
            ),
            SizedBox(height: 40.0,),
            Row(
              children: <Widget>[
                SizedBox(width: 100.0,),
                RaisedButton(
                  child: Text('Internal Medicine',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red)
                  ),
                ),
                SizedBox(width: 30.0,),
                Icon(Icons.arrow_upward,color: Colors.white,),
                Icon(Icons.arrow_downward,color: Colors.white,),
              ],
            ),
            SizedBox(height: 130.0,),
            Row(
              children:<Widget>[
                SizedBox(width: 50.0,),
                Image.asset('assets/Corona.png',height:180.0,cacheHeight: 120,),
              ],
            ),
            SizedBox(height: 60.0,),
            Row(
              children: <Widget>[
                SizedBox(width: 100.0,),
                RaisedButton(
                  child: Text('    C O R O N A    ',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Corona()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red)
                  ),
                ),
                SizedBox(width: 30.0,),
                Icon(Icons.arrow_upward,color: Colors.white,),
              ],
            ),
            SizedBox(height: 120.0,),
          ],
        ),
      ),
    );
  }
}
