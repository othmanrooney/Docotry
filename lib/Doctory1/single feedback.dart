import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class singlefeedback extends StatelessWidget {
  final String feel;
  final String name;
  final String clinic;
  final String feed;

  const singlefeedback({Key key, this.feel, this.name, this.clinic, this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Feedy"),
        ),
         body: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [

               Container(

                 color: Colors.lightBlue,
                 child: Padding(
                   padding: const EdgeInsets.all(25.0),
                   child: Center(child: Text("Patient Feedback Form : ",style:
                   TextStyle(fontSize: 30,color: Colors.white),
                   )
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Row(
                   children: [
                     Text("clinic name : ",style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold,fontSize: 20),),
                     Text(clinic,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 18),),
                   ],
                 ),
               ),
               Divider(
                 color: Colors.green,
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                   child: Text(name,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 25),),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.only(top: 20),
                 child: Text(feed),
               ),
             ],
           ),
         ),
      ),
    );
  }
}
