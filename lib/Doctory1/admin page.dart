
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

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
                Text("Dashboard"),
                Text("Manage"),
              ],
            ),
            title: Text("Admin Page"),
            centerTitle: true,
          ),
          body: Container(
            child: TabBarView(
              children: [
                Container(
                 child: Center(
                   child: Text(
                     "Dashboard"
                   ),
                 ),
                ),
                Container(
                  child: Center(
                    child: Text(
                        "Manage"
                    ),
                  ),
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
