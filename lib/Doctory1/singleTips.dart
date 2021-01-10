
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleTips extends StatelessWidget{
    final String name;
    final String type;
    final String desc;

  const SingleTips({Key key, this.name, this.type, this.desc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tips'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
          Stack(
          children: <Widget>[
          Container(
          padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/header.jpg'),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 60.0),
                Icon(
                  Icons.description,
                  color: Colors.white,
                  size: 30.0,
                ),
                Container(
                  width: 90.0,
                  child: new Divider(color: Colors.green),
                ),
                SizedBox(height: 10.0),
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 45.0),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(flex: 1, child: Container(
                      child: Container(
                        child: LinearProgressIndicator(
                            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                            value: 2,
                            valueColor: AlwaysStoppedAnimation(Colors.green)),
                      ),
                    ),),
                    Expanded(
                        flex: 6,
                        child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              type,
                              style: TextStyle(color: Colors.white),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ),
        ],
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: <Widget>[
            Text(desc,
            style: TextStyle(fontSize: 18.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () => {},
                color: Color.fromRGBO(58, 66, 86, 1.0),
                child:
                Text("BACk", style: TextStyle(color: Colors.white)),
              )),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
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
