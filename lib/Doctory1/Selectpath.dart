import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctory/Doctory1/Start.dart';
import 'package:doctory/INTERNAL/anmate.dart';
import 'package:doctory/Services/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Corona/CoronaVirus.dart';
import 'Feedback page.dart';
import 'SelectPart.dart';
import 'Tipspage.dart';

class pathselect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var images=FirebaseFirestore.instance.collection('money');
   AuthServices _auth=AuthServices();
    final ScrollController _scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Path Select",style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        drawer:  Drawer(
          elevation: 3,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  DrawerHeader(
                    child:ListView(
                      children: [
                        CarouselSlider(
                          items: [

                            //1st Image of Slider
                            Container(
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/header.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: GestureDetector(
                                onTap:(){
                                  launch('https://youtu.be/vWzEao1mXfo');
                                },
                              ),
                            ),

                            //2nd Image of Slider
                            Container(
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image:  AssetImage('assets/header2.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  launch('https://youtu.be/5DGwOJXSxqg');
                                },
                              ),
                            ),

                            //3rd Image of Slider
                            Container(
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/header3.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  launch('https://youtu.be/9Fr2GCWXc40');
                                },
                              ),
                            ),

                          ],

                          //Slider Container properties
                          options: CarouselOptions(
                            height: 120.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text('Contact us'),
                    onTap: () => {
                      showDialog(context: context,
                      useSafeArea: true,
                      barrierDismissible:false,
                      builder: (_)=>CupertinoAlertDialog(
                        title: Text("Contact US"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton.icon(onPressed: () {
                              launch('mailto: bilalfrieg@gmail.com');
                            },
                            icon: Icon(Icons.email,color:Colors.lightBlue),
                              label: Text("Email"),
                            ),
                            FlatButton.icon(onPressed: () {
                              launch('tel://0787557125');
                            },
                              icon: Icon(Icons.phone_android,color:Colors.lightBlue,),
                              label: Text("phone"),
                            ),
                          ],
                        ),
                      ),)
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.fingerprint),
                    title: Text('Leave a tip'),
                    onTap: () => {Navigator.push(context,MaterialPageRoute(builder: (context)=>Tipspage()))},
                  ),
                  ListTile(
                    leading: Icon(Icons.border_color),
                    title: Text('Feedback'),
                    onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>feedback()))},
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: ()async{
                      await _auth.signOut();
                      // SharedPreferences prefs = await SharedPreferences.getInstance();
                      // prefs.remove('email');
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          StatrPage()), (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            ),
        ),
        body: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: ListView(
            shrinkWrap: true,
            controller: _scrollController,
            children: <Widget>[
              Container(
                color: Colors.lightBlue,
                child: Center(
                  child:Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top:30.0),
                        child: Text('Determine Part',style: TextStyle(fontSize:35.0,color: Colors.white,decoration: TextDecoration.none,fontWeight: FontWeight.bold),),
                      ),
                      Row(
                        children:<Widget>[
                          SizedBox(width: 60.0,),
                          GestureDetector(child: Image.asset('assets/selectpage2.png',height:300.0,)
                          ,
                          onTap: () => Navigator.push(
                              context,MaterialPageRoute( builder: (context)=>SelectPart()))),
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
                          // SizedBox(width: 35.0,),
                          // Icon(Icons.arrow_downward,color: Colors.white,),
                        ],
                      ),
                      SizedBox(height: 130.0,),
                      Row(
                        children:<Widget>[
                          GestureDetector(
                              child: Image.asset('assets/JSM2.png',height:240.0,),
                            onTap: () =>  Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimationDemo())),

                          ),
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
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimationDemo()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.red)
                            ),
                          ),
                          // SizedBox(width: 30.0,),
                          // Icon(Icons.arrow_upward,color: Colors.white,),
                          // Icon(Icons.arrow_downward,color: Colors.white,),
                        ],
                      ),
                      SizedBox(height: 130.0,),
                      Row(
                        children:<Widget>[
                          SizedBox(width: 50.0,),
                          GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Corona())),
                              child: Image.asset('assets/Corona.png',height:180.0,cacheHeight: 120,)),
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
                          // SizedBox(width: 30.0,),
                          // Icon(Icons.arrow_upward,color: Colors.white,),
                        ],
                      ),
                      SizedBox(height: 120.0,),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
