import 'package:doctory/External/Lower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_drawing/path_drawing.dart';

import 'FadeAnimation.dart';
class SelectPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title:Text('Where is Your pain',style: TextStyle(fontSize: 25.0,color: Colors.white,decoration: TextDecoration.none),),

        ),
        body: SingleChildScrollView(
          child: Center(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 60,),
                    FadeAnimation(1,GestureDetector(
                      child: Card(
                        color: Colors.lightBlue,
                      child: Image(image: AssetImage('assets/heads.png'),),
                      ),
                    ),),
                    
                    FadeAnimation(3,GestureDetector(
                      child: Card(
                      color: Colors.lightBlue,
                        child: Image(image: AssetImage('assets/body2.png'),),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.lightBlue, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),),
                    
                    FadeAnimation(5,GestureDetector(
                      child: Card(
                        color: Colors.lightBlue,
                        child: Image(image: AssetImage('assets/body3.png'),),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.lightBlue, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: FadeAnimation(1,FlatButton(
                        onPressed: () {
                          Text("Wait");
                          Navigator.pop(context);
                        },
                        child: Text("Back",style: TextStyle(color: Colors.white),),
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.lightBlue, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        splashColor: Colors.white,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }
}
// child: Hero(
//   tag: 'select2',
//
//   child: Container(
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         fit: BoxFit.cover,
//         image:AssetImage('assets/selectpage2.png'),
//       ),
//     ),
//     child: Expanded(
//       child: Column(
//         children: <Widget>[
//           SizedBox(height: 30.0,),
//           Text('Where is Your pain',style: TextStyle(fontSize: 30.0,color: Colors.white,decoration: TextDecoration.none),),
//           SizedBox(height:MediaQuery.of(context).size.height/26,
//             child: Container(color: Colors.transparent,),),
//           SizedBox(width:MediaQuery.of(context).size.width*0.3,height:MediaQuery.of(context).size.height*0.2,
//             child:  GestureDetector(
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>lower()));
//               },
//               child: Container(
//                 color: Colors.transparent,
//               ),
//             ),
//           ),
//           SizedBox(height: 20.0,),
//           Row(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width*0.3,
//               ),
//               SizedBox(
//                 height:MediaQuery.of(context).size.height*0.192, width:MediaQuery.of(context).size.width*0.1,
//                 child: GestureDetector(
//                   onTap: (){
//
//                   },
//                   child: Container(
//                     color: Colors.transparent,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 5,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.12,width: 75.0,
//                 child: GestureDetector(
//                   onTap: (){
//                   },
//                   child: Container(
//                     color: Colors.transparent,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 10.0,
//               ),
//               SizedBox(
//                 height:MediaQuery.of(context).size.height*0.192, width:MediaQuery.of(context).size.width*0.1,
//                 child: GestureDetector(
//                   onTap: (){
//                   },
//                   child: Container(
//                     color: Colors.transparent,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Container(
//                 width: MediaQuery.of(context).size.width/2.4,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width*0.2,height:MediaQuery.of(context).size.height/14,
//                 child: GestureDetector(
//                   child: Container(
//                     color: Colors.transparent,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Container(
//                 width: MediaQuery.of(context).size.width*0.39,
//               ),
//               SizedBox(
//                 width: 30.0,height: 90.0,
//                 child: GestureDetector(
//                   child: Container(
//                     color: Colors.transparent,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 30.0,
//               ),
//               SizedBox(
//                 width: 30.0,height: 90.0,
//                 child: GestureDetector(
//                   child: Container(
//                     color: Colors.transparent,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height:MediaQuery.of(context).size.height/25,),
//           Row(
//             children: <Widget>[
//               RaisedButton.icon(onPressed: () {
//                 Navigator.pop(context);
//               },
//                 icon:
//                 Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: 30.0,
//                 ),
//                 label: Text('Back',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 color: Colors.lightBlue,
//                 splashColor:Colors.cyan,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   ),
// ),