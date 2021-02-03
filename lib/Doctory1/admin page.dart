
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Selectpath.dart';

class admin extends StatefulWidget {
  @override
  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text("Manage App"),
                Text("View All Doctors"),
              ],
            ),
            title: Text("Admin Page"),
            centerTitle: true,
          ),
          body: Container(
            child: TabBarView(
              children: [
                Stack(
                  children: <Widget>[
                    ClipPath(
                      child: Container(color: Colors.black.withOpacity(0.8)),
                      clipper: getClipper(),
                    ),
                    Positioned(
                        width: 350.0,
                        top: MediaQuery.of(context).size.height / 5,
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 7.0, color: Colors.black)
                                    ])),
                            SizedBox(height: 90.0),
                            Text(
                              'Othman Doctory',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                               ),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              '',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                            SizedBox(height: 25.0),
                            Container(
                                height: 30.0,
                                width: 95.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Colors.green,
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>pathselect()));
                                    },
                                    child: Center(
                                      child: Text(
                                        'Doctory',
                                        style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(height: 25.0),
                            Container(
                                height: 30.0,
                                width: 95.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.redAccent,
                                  color: Colors.lightBlueAccent,
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      launch('https://app.jetadmin.io/app/doctory/models/3a2565b4-1e37-4f6f-995a-06abc87e5bd3.user?page=1');
                                    },
                                    child: Center(
                                      child: Text(
                                        'Manage',
                                        style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ))
                  ],
                ),
                StreamBuilder(
                 stream: FirebaseFirestore.instance.collection('user').snapshots(),
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
                                                   radius: 50.0,
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
                                                   course['clincname'],
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
                                   Card(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         course['image']==null?CircularProgressIndicator():
                                         Expanded(
                                           child: ClipRRect(
                                             //child:
                                             borderRadius: BorderRadius.circular(20.0),
                                             child: Image.network(course['image'],width: 120,height: 120,) ,
                                           ),
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
                                                 Text("Fees : "+course['fees']),
                                               ],
                                             ),
                                           ],
                                           // Text("Name :"+lists[index]['name'],style:
                                           // TextStyle(color: Colors.lightBlue,fontSize: 15,fontWeight: FontWeight.bold),
                                           // ),
                                           // Image.network(lists[index]['image']),
                                         ),
                                         Expanded(
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.end,
                                             children: [
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.end,
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
                                         ),
                                       ],
                                     ),
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
              ],
            ),
          ),
              /* ListView(
            padding: EdgeInsets.all(30),
           shrinkWrap: true,
           children: [
             CarouselSlider(
          items: [
            GestureDetector(
              onTap: () {

              },

              child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                child: Container(

                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width/2,
                  color: Colors.lightBlue,
                  child: Center(child: Text("Admin Panel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>pathselect()));
              },
              child: Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(

                  color: Colors.lightBlue,
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width/2,
                  child: Center(child: Text("Continue as a user",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),)),
                ),
              ),
            ),
          ],
               options: CarouselOptions(
                 height: 140.0,
                 enlargeCenterPage: true,
                 autoPlay: true,
                 aspectRatio: 16 / 9,
                 autoPlayCurve: Curves.fastOutSlowIn,
                 enableInfiniteScroll: true,
                 autoPlayAnimationDuration: Duration(milliseconds: 800),
                 viewportFraction: 0.8,
               ),
             ),
            SizedBox(height: MediaQuery.of(context).size.height/7),
            Image(
              image: NetworkImage('http://www.sfdcpoint.com/wp-content/uploads/2019/01/Salesforce-Admin-Interview-questions.png'),
            ),

           ],
          ),
              * */

        ),
      ),
    );
  }
}
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}