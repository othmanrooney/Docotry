import 'dart:convert';
import 'package:doctory/Corona/Tcases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Tcountry.dart';
import 'jordan.dart';
import 'package:url_launcher/url_launcher.dart';

class Corona extends StatefulWidget {
  @override
  _CoronaState createState() => _CoronaState();
}
class _CoronaState extends State<Corona> {


  Future<Tcases> getjsonData() async{
    var response= await http.get(
        Uri.encodeFull(url),
    );
    if(response.statusCode==200){
      final converDataJSON = jsonDecode(response.body);
      return Tcases.fromJson(converDataJSON);
    }
    else{
      throw Exception('try to Reload');
    }
  }
  @override void initState() {
    super.initState();
    this.getjsonData();
  }
  navigateToCountry()async{
    await Navigator.push(context, MaterialPageRoute(builder:
        (context)=>world()));
  }
  navigatejordan()async{
    await Navigator.push(context, MaterialPageRoute(builder:
        (context)=>Jordan()));
  }
  navigateToHM(url)async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      Text('Link is not Working \n');
    }
  }
  final String url="https://corona.lmao.ninja/v2/all";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('COVID-19'),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
      child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Padding(padding: EdgeInsets.only(top: 50),),


                Text('Stay',style: TextStyle(
                  color: Colors.lightBlue
                      ,fontSize: 25,fontWeight: FontWeight.bold
                ),),
                Card(
                  color: Colors.lightBlue,
                  child: Text('Home',style: TextStyle(
                      color: Colors.white
                      ,fontSize: 25,fontWeight: FontWeight.bold
                  ),),
                ),

              ],
            ),
          ),
            Padding(padding: EdgeInsets.only(top: 40.0),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                Text('WorldWide Statistics',style: TextStyle(
                  fontSize: 16.0,color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),),
                OutlineButton(
                  color: Colors.lightBlue,
                  borderSide: BorderSide(color: Colors.lightBlue),
                  onPressed: () {

                  },
                  child: Text('Jordan Statistics' ,style: TextStyle(
                    fontSize: 16.0,fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                ),
              ],
            ),
            FutureBuilder<Tcases>(
              future:getjsonData(), 
              builder:(BuildContext context,SnapShot){
                final covid = SnapShot.data;
                if(SnapShot.hasData){
                  return Column(
                    children:<Widget>[
                      Card(
                        color: Colors.lightBlue,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("${covid.cases}\,",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight:FontWeight.bold,
                              ),),
                              Text("${covid.deaths}\,",style: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 20,
                                fontWeight:FontWeight.bold,
                              ),),
                              Text("${covid.recovered}",style: TextStyle(
                                color: Colors.lightGreenAccent,
                                fontSize: 20,
                                fontWeight:FontWeight.bold,
                              ),),
                            ],
                          ),
                        ),

                        ),
                    ],
                  );
                }
                else if(SnapShot.hasError){
                  return Text(SnapShot.error.toString());
                }
                else return Center(child: CircularProgressIndicator());
              },
            ),

            Container(
              child: Card(
                color:Colors.blue,
                child:ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Total Cases\,',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight:FontWeight.bold,
                      ),
                      ),
                      Text("Deaths\,",style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 20,
                        fontWeight:FontWeight.bold,
                      ),
                      ),
                      Text("recovered",style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontSize: 20,
                        fontWeight:FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:20),),

            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        navigatejordan();
                      },
                      child: Card(
                child: Container(
                      color: Colors.lightBlue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                        Image(image:AssetImage('assets/jordans.png'),
                        height: 90,
                        width: 90,),
                          Padding(padding: EdgeInsets.all(10),),
                          OutlineButton(
                            borderSide: BorderSide(color: Colors.white),
                            onPressed: (){
                              navigatejordan();
                            },
                            child:
                            Text('Jordan StateWise Statistics',style:
                              TextStyle(
                                fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                              ),),
                          ),
                        ],
                      ),
                ),
              ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        navigateToCountry();
                      },
                      child: Card(
                        child: Container(
                       color:  Colors.lightBlue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image(image:AssetImage('assets/world.png'),
                                fit: BoxFit.cover,
                                height: 90,
                                width: 90,),
                              Padding(padding: EdgeInsets.all(10),),
                              OutlineButton(
                                borderSide: BorderSide(color: Colors.white,),
                                onPressed: (){
                                  navigateToCountry();
                                },
                                child:
                                Text('World  StateWise Statistics',style:
                                TextStyle(
                                  fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30),),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Card(
                      child: Container(
                        color: Colors.lightBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(image:AssetImage('assets/myth.png'),
                              height: 90,
                              width: 90,),
                            Padding(padding: EdgeInsets.all(10),),
                            OutlineButton(
                              borderSide: BorderSide(color: Colors.white),
                              onPressed: (){
                                navigateToHM("https://www.who.int/news-room/q-a-detail/q-a-coronaviruses");
                              },
                              child:
                              Text('        Myth  Buster       ',
                                style: TextStyle(
                                fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  Expanded(
                    child: Card(
                      child: Container(
                        color:  Colors.lightBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(image:AssetImage('assets/umb.jpg',),
                              fit: BoxFit.cover,
                              height: 90,
                              width: 90,),
                            Padding(padding: EdgeInsets.all(10),),
                            OutlineButton(
                              borderSide: BorderSide(color: Colors.white),
                              onPressed: (){
                                launch("tel://911");
                              },
                              child: Text('Call 911',style:
                              TextStyle(
                                fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          ),
      ),
            padding: EdgeInsets.only(bottom: 20),
          ),
        ),
      ),
    );
  }
}
