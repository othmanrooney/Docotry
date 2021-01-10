// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// class ClinicsCardiology extends StatefulWidget {
//
//   @override
//   _ClinicsCardiologyState createState() => _ClinicsCardiologyState();
// }
//
// class _ClinicsCardiologyState extends State<ClinicsCardiology> {
//   final TextStyle _style = TextStyle(color: Colors.black);
//
//   final Firref=FirebaseFirestore.instance.collection('user');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       appBar: AppBar(title:Center(
//         child:
//         Text('Clinics' , style: TextStyle(fontSize: 30.0 ,color: Colors.white),),),),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             StreamBuilder(
//               stream: FirebaseFirestore.instance.collection('user').snapshots(),
//               builder: (context, snapshot) {
//                 if(snapshot.hasData){
//                   print("yes");
//                   print(snapshot.data.documents.length);
//                   //    lists.clear();
//                   // Map<dynamic, dynamic> values = snapshot.data.value;
//                   // values.forEach((key, values) {
//                   //   lists.add(values);
//                   // });
//                   //  print(lists.length);
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: snapshot.data.documents.length,
//                     itemBuilder: (context, int index){
//                       DocumentSnapshot course=snapshot.data.documents[index];
//                       return Padding(
//                         padding: EdgeInsets.all(3),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(color: Colors.lightBlue, spreadRadius: 3),
//                             ],
//                           ),
//                           // elevation: 3,
//                           // shape: RoundedRectangleBorder(
//                           //   side: BorderSide(width: 1, color: Colors.black),
//                           //   borderRadius: BorderRadius.circular(32),
//                           // ),
//
//                           child: RawMaterialButton(
//                             onPressed: () {
//                               showModalBottomSheet(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                 ),
//                                   context: context,
//                                   builder: (BuildContext bc){
//                                     return Container(
//                                       child: SingleChildScrollView(
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: <Widget>[
//                                             SizedBox(height: 10,),
//                                             CircleAvatar(
//                                               radius: 50.0,
//                                               backgroundImage: NetworkImage(course['image']),
//                                               backgroundColor: Colors.lightBlue,
//                                               foregroundColor: Colors.lightBlue,
//                                             ),
//                                             Text(
//                                               course['name'],
//                                               style: TextStyle(
//                                                 fontSize: 30.0,
//                                                 color: Colors.lightBlue.shade900,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             Text(
//                                               course['clincname'],
//                                               style: TextStyle(
//                                                 fontFamily: 'Source Sans Pro',
//                                                 color: Colors.green,
//                                                 fontSize: 20.0,
//                                                 letterSpacing: 2.5,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 20.0,
//                                               width: 150.0,
//                                               child: Divider(
//                                                 color: Colors.teal.shade100,
//                                               ),
//                                             ),
//                                             Card(
//                                                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                                                 child: ListTile(
//                                                   leading: Icon(
//                                                     Icons.phone,
//                                                     color: Colors.lightBlue,
//                                                   ),
//                                                   title:OutlineButton(
//                                                     borderSide: BorderSide(color: Colors.white),
//                                                     onPressed: (){
//                                                       launch("tel://"+course['phone']);
//                                                     },
//                                                     child: Text(
//                                                       'Call Directly',
//                                                       style: TextStyle(
//                                                         color: Colors.lightBlue.shade900,
//                                                         fontFamily: 'Source Sans Pro',
//                                                         fontSize: 20.0,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )),
//                                             Card(
//                                                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                                                 child: ListTile(
//                                                   leading: Icon(
//                                                     Icons.email,
//                                                     color: Colors.teal,
//                                                   ),
//                                                   title: Text(
//                                                     "othman@gmail.com",
//                                                     style: TextStyle(
//                                                         fontSize: 20.0,
//                                                         color: Colors.teal.shade900,
//                                                         fontFamily: 'Source Sans Pro'),
//                                                   ),
//                                                 )),
//                                             Card(
//                                                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                                                 child: ListTile(
//                                                   leading: Icon(
//                                                     Icons.location_city,
//                                                     color: Colors.teal,
//                                                   ),
//                                                   title: Text(
//                                                     course['dist'],
//                                                     style: TextStyle(
//                                                         fontSize: 20.0,
//                                                         color: Colors.teal.shade900,
//                                                         fontFamily: 'Source Sans Pro'),
//                                                   ),
//                                                 )),
//                                             Card(
//                                                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                                                 child: ListTile(
//                                                   leading: Icon(
//                                                     Icons.description,
//                                                     color: Colors.teal,
//                                                   ),
//                                                   title: Text(
//                                                     course['Desc'],
//                                                     style: TextStyle(
//                                                         fontSize: 20.0,
//                                                         color: Colors.teal.shade900,
//                                                         fontFamily: 'Source Sans Pro'),
//                                                   ),
//                                                 )
//                                             ),
//                                                   SizedBox(height: 10,),
//                                           ],
//                                         )
//                                       ),
//                                     );
//                                   }
//                               );
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     course['image']==null?CircularProgressIndicator():
//                                     ClipRRect(
//                                       //child:
//                                       borderRadius: BorderRadius.circular(20.0),
//                                       child: Image.network(course['image'],width: 120,height: 120,) ,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children:[
//                                         Row(
//                                           children: [
//                                             Icon(Icons.person),
//                                             Text("Dr. "+course['name']),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children:[
//                                             Icon(Icons.local_hospital),
//                                             Text("  "+course['clincname']+" clinic"),
//                                           ],
//                                         ),
//                                       ],
//                                       // Text("Name :"+lists[index]['name'],style:
//                                       // TextStyle(color: Colors.lightBlue,fontSize: 15,fontWeight: FontWeight.bold),
//                                       // ),
//                                       // Image.network(lists[index]['image']),
//                                     ),
//                                     SizedBox(width: 10.0,),
//                                     Column(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             RaisedButton(
//                                               color: Colors.lightBlue,
//                                               child: Text("Map"),
//                                               onPressed: () {
//
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//
//                   );
//                 }
//                 return CircularProgressIndicator();
//               },
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ClinicsCardiology extends StatefulWidget {

  @override
  _ClinicsCardiologyState createState() => _ClinicsCardiologyState();
}

class _ClinicsCardiologyState extends State<ClinicsCardiology> {
  final TextStyle _style = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title:Center(
        child:
        Text('Clinics' , style: TextStyle(fontSize: 30.0 ,color: Colors.white),),),),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user').where('type',isEqualTo:'Cardiology').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            print("yes");
            print(snapshot.data.documents.length);
            //    lists.clear();
            // Map<dynamic, dynamic> values = snapshot.data.value;
            // values.forEach((key, values) {
            //   lists.add(values);
            // });
            //  print(lists.length);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, int index){
                var course=snapshot.data.docs[index];
                return Padding(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.lightBlue, spreadRadius: 3),
                      ],
                    ),
                    // elevation: 3,
                    // shape: RoundedRectangleBorder(
                    //   side: BorderSide(width: 1, color: Colors.black),
                    //   borderRadius: BorderRadius.circular(32),
                    // ),

                    child: RawMaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            context: context,
                            builder: (BuildContext bc){
                              return Container(
                                child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(height: 10,),
                                        CircleAvatar(
                                          radius: 100.0,
                                          backgroundImage: NetworkImage(course['image']),
                                          backgroundColor: Colors.lightBlue,
                                          foregroundColor: Colors.lightBlue,
                                        ),
                                        Text(
                                          course['name'],
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          course['clincname']+" Clinic",
                                          style: TextStyle(
                                            fontFamily: 'Source Sans Pro',
                                            color: Colors.green,
                                            fontSize: 20.0,
                                            letterSpacing: 2.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                        course['fees']+" JD",
                                          style: TextStyle(
                                            fontFamily: 'Source Sans Pro',
                                            color: Colors.green,
                                            fontSize: 20.0,
                                            letterSpacing: 2.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                          width: 150.0,
                                          child: Divider(
                                            color: Colors.teal.shade100,
                                          ),
                                        ),
                                        Card(
                                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.phone,
                                                color: Colors.lightBlue,
                                              ),
                                              title:OutlineButton(
                                                borderSide: BorderSide(color: Colors.white),
                                                onPressed: (){
                                                  launch("tel://"+course['phone']);
                                                },
                                                child: Text(
                                                  'Call Directly',
                                                  style: TextStyle(
                                                    color: Colors.lightBlue.shade900,
                                                    fontFamily: 'Source Sans Pro',
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                            )),
                                        GestureDetector(
                                          onTap: () {
                                            launch('mailto:'+course['email']);
                                          },
                                          child: Card(
                                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                                              child: ListTile(
                                                leading: Icon(
                                                  Icons.email,
                                                  color: Colors.teal,
                                                ),
                                                title: Text(
                                                  course['email'],
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.teal.shade900,
                                                      fontFamily: 'Source Sans Pro'),
                                                ),
                                              )),
                                        ),
                                        Card(
                                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.location_city,
                                                color: Colors.teal,
                                              ),
                                              title: Text(
                                                course['dist'],
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.teal.shade900,
                                                    fontFamily: 'Source Sans Pro'),
                                              ),
                                            )),
                                        Card(
                                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.description,
                                                color: Colors.teal,
                                              ),
                                              title: Text(
                                                course['Desc'],
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.teal.shade900,
                                                    fontFamily: 'Source Sans Pro'),
                                              ),
                                            )
                                        ),
                                        SizedBox(height: 10,),
                                      ],
                                    )
                                ),
                              );
                            }
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              course['image']==null?CircularProgressIndicator():
                              ClipRRect(
                                //child:
                                borderRadius: BorderRadius.circular(60.0),
                                child: Image.network(course['image'],width: 100,height: 100,),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Row(
                                    children: [
                                      Icon(Icons.person),
                                      Text("Dr. "+course['name']),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Icon(Icons.local_hospital),
                                      Text("  "+course['clincname']+" clinic"),
                                    ],
                                  ),
                                ],
                                // Text("Name :"+lists[index]['name'],style:
                                // TextStyle(color: Colors.lightBlue,fontSize: 15,fontWeight: FontWeight.bold),
                                // ),
                                // Image.network(lists[index]['image']),
                              ),
                              SizedBox(width: 10.0,),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      RaisedButton(
                                        color: Colors.lightBlue,
                                        child: Text("Map"),
                                        onPressed: () {
                                          launch(course['map']);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              },

            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}