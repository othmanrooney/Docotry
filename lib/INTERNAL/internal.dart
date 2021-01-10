//cards.dart
import 'package:flutter/material.dart';
import 'ClinicsDermatology.dart';
import 'ClinicsCardiology.dart';
import 'ClinicsHematology.dart';
import 'ClinicsNeurology.dart';
import 'ClinicsPedistric.dart';
import 'ClinicsOncology.dart';
import 'ClinicsUrology.dart';
import 'ClinicsNerves.dart';

class DemoCard extends StatelessWidget {

  //static final Shadow _shadow = Shadow(offset: Offset(2.0, 2.0), color: Colors.black26);
  final TextStyle _style = TextStyle(color: Colors.lightBlue);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> ClinicsDermatology(),
                ),
              );
            },
            child:
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(32)
              ),
              child: Container(
                constraints: BoxConstraints.expand(height: 200),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> ClinicsCardiology(),
                      ),
                    );
                  },
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Dermatology", style: _style.copyWith(fontSize: 20.0),),
                          Container(
                            width: 150.0,
                            height: 100.0,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  30)),
                              image: new DecorationImage(
                                image: new AssetImage('assets/path/Dermatology.jpg'),
                              ),
                            ),
                          ),
                        ],

                      ),
                    ],
                  ),
                ),
              ),
            ),

          ),//cardiology
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> ClinicsCardiology(),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(32)
                ),
                child: Container(
                  constraints: BoxConstraints.expand(height: 200),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> ClinicsCardiology(),
                        ),
                      );
                    },
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: [
                                Text("Cardiology",
                                    style: _style.copyWith(fontSize: 20.0)),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        30)),
                                    image: new DecorationImage(
                                      image: new AssetImage('assets/path/Cardiology.jpg'),
                                    ),
                                  ),
                                  //Image.asset('imeges/'+item.image,width: 150.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
            ),
          ),//dermatology
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> ClinicsHematology(),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(32)
                ),
                child: Container(
                  constraints: BoxConstraints.expand(height: 200),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> ClinicsPedistric(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text("Hematology",
                                style: _style.copyWith(fontSize: 20.0)),
                            Container(
                              width: 150.0,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    30)),
                                image: new DecorationImage(
                                  image: new AssetImage('assets/path/Hematology.jpg'),
                                ),
                              ),
                            ),
                          ],

                        ),
                      ],
                    ),
                  ),
                )
            ),
          ),//Hematology
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> ClinicsPedistric(),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(32)
                ),
                child: Container(
                  constraints: BoxConstraints.expand(height: 200),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> ClinicsNeurology(),
                        ),
                      );
                    },
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text("Pediatric",
                                style: _style.copyWith(fontSize: 20.0)),
                            Container(
                              width: 150.0,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    30)),
                                image: new DecorationImage(
                                  image: new AssetImage('assets/path/Pediatric.jpg'),
                                ),
                              ),
                            ),
                          ],

                        ),
                      ],
                    ),
                  ),
                )
            ),
          ),//Pediatric
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> ClinicsNeurology(),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(32)
                ),
                child: Container(
                  constraints: BoxConstraints.expand(height: 200),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> ClinicsNeurology(),
                        ),
                      );
                    },
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: [
                                Text("Neurology",
                                    style: _style.copyWith(fontSize: 20.0)),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  width: 150.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        30)),
                                    image: new DecorationImage(
                                      image: new AssetImage('assets/path/Neurology.jpg'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
            ),
          ),//Neurology
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> ClinicsNeurology(),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(32)
                ),
                child: Container(
                  constraints: BoxConstraints.expand(height: 200),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> ClinicsUrology(),
                        ),
                      );
                    },
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: [
                                Text("Urology ",
                                    style: _style.copyWith(fontSize: 20.0)),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        30)),
                                    image: new DecorationImage(
                                      image: new AssetImage('assets/path/Urology.jpg'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                )
            ),
          ),//Urology
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> ClinicsOncology(),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(32)
                ),
                child: Container(
                  constraints: BoxConstraints.expand(height: 200),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> ClinicsOncology(),
                        ),
                      );
                    },
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: [
                                Text( "Oncology",
                                    style: _style.copyWith(fontSize: 20.0)),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        30)),
                                    image: new DecorationImage(
                                      image: new AssetImage('assets/path/Oncology.jpg'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],

                        ),
                      ],
                    ),
                  ),
                )
            ),
          ), //Oncology
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> ClinicsNerves(),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(32)
                ),
                child: Container(
                  constraints: BoxConstraints.expand(height: 200),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> ClinicsNerves(),
                        ),
                      );
                    },
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: [
                                Text( "Nerves",
                                    style: _style.copyWith(fontSize: 20.0)),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        30)),
                                    image: new DecorationImage(
                                      image: new AssetImage('assets/path/Nerves.jpg'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],),
                      ],),), ) ), ),], ),
    );
  }
}