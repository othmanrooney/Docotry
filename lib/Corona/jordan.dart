import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'TJordan.dart';

class Jordan extends StatefulWidget {
  @override
  _JordanState createState() => _JordanState();
}

class _JordanState extends State<Jordan> {
  final String url="https://coronavirus-19-api.herokuapp.com/countries/jordan#";
  Future<Tjordan> getjsonData() async{
    var response= await http.get(
      Uri.encodeFull(url),
    );
    if(response.statusCode==200){
      final converDataJSON = jsonDecode(response.body);
      return Tjordan.fromJson(converDataJSON);
    }
    else{
      throw Exception('try to Reload');
    }
  }
  @override void initState() {
    super.initState();
    this.getjsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JORDAN",),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child:
        Column(
          children: <Widget>[
            Padding(padding: (
            EdgeInsets.only(bottom: 10.0)
            ),),
            FutureBuilder<Tjordan>(
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
                              Text("${covid.cases}",style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight:FontWeight.bold,
                              ),),
                              Text("${covid.deaths}",style: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 23,
                                fontWeight:FontWeight.bold,
                              ),),
                              Text("${covid.recovered}",style: TextStyle(
                                color: Colors.lightGreenAccent,
                                fontSize: 23,
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
                else return CircularProgressIndicator();
              },
            ),
            Container(
              child: Card(
                color:Colors.blue,
                child:ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Total Cases',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight:FontWeight.bold,
                      ),
                      ),
                      Text("Deaths",style: TextStyle(
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
            Image(image: AssetImage("assets/COVID-19-Card-3.jpg"),),
          ],
        ),
      ),
    );
  }
}