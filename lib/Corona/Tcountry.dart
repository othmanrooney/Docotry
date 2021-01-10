import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class world extends StatefulWidget {
  @override
  _worldState createState() => _worldState();
}

class _worldState extends State<world> {
  final String url="https://corona.lmao.ninja/v2/countries";

  Future<List> datas;
  Future <List> getData()async{

      var response= await Dio().get(url);
      return response.data;
  }
  @override
  void initState() {
    super.initState();
  datas=getData();
  }

  Future showcases(String cases,tdeath,death,recover)async{
    await showDialog(
        context: context,
        builder:(BuildContext context){
          return AlertDialog(
            backgroundColor: Colors.black38,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Total cases :$cases',style: TextStyle(
                    fontSize: 25,color: Colors.white,
                  ),),
                  Text('Today  Death :$tdeath',style: TextStyle(
                    fontSize: 25,color: Colors.red,
                  ),),
                  Text('Total Deaths :$death',style: TextStyle(
                    fontSize: 25,color: Colors.red,
                  ),),
                  Text('Total Recovered :$recover',style: TextStyle(
                    fontSize: 25,color: Colors.green,
                  ),),
                ],
              ),
            ),
          );
        },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country wise Statistics'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: datas,
          builder: (BuildContext,Snpashot)
            {
              if(Snpashot.hasData){
                return GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 207,
                  itemBuilder: (BuildContext  , index) => SizedBox(
                    height: 50,width: 50,
                    child: GestureDetector(
                      onTap:() => showcases(
                        Snpashot.data[index]['cases'].toString(),
                        Snpashot.data[index]['todayDeaths'].toString(),
                        Snpashot.data[index]['deaths'].toString(),
                        Snpashot.data[index]['recovered'].toString(),
                      ),
                      child: Card(
                        color: Colors.lightBlue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            Text("Total cases:${Snpashot.data[index]['cases'].toString()}",
                            style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 5),
                            ),
                            Image(image:AssetImage('assets/ehabcorona.png'),
                            height: 100, width: 100,
                            ),
                            Expanded(
                              child: Text(Snpashot.data[index]['country'],
                              style: TextStyle(
                                color: Colors.white,fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        ),
      ),

    );
  }
}
