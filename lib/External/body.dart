
import 'package:doctory/INTERNAL/ClinicsDermatology.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

import 'Dermatologist.dart';
import 'eat.dart';
import 'org.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body>with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),

    );

    _controller.forward();

    _animation = Tween(
      begin: 0.0,
      end: 5.0,
    ).animate(_controller);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: (
            AppBar(
              title: Text('Body Clinic',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              centerTitle: true,
            )),
        body: SizeTransition(
          sizeFactor: _animation,
          axis: Axis.vertical,
          axisAlignment: -1,
          child: ListView(
            children: [
              ShapeOfView(
                shape: ArcShape(
                    direction: ArcDirection.Outside,
                    height: 20,
                    position: ArcPosition.Right
                ),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(image: AssetImage('assets/orginal.jpg'),fit: BoxFit.fitWidth,),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        child: Text("Physical Therapy",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>orginal()));
                        },
                      ),
                    ],
                  ),
                ),
              ),

              ShapeOfView(
                shape: ArcShape(
                    direction: ArcDirection.Outside,
                    height: 20,
                    position: ArcPosition.Right
                ),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(image: AssetImage('assets/eat.jpg'),fit: BoxFit.fitWidth,),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        child: Text("Nutrition Specialist",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>nutrition_specialist()));
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                child: ShapeOfView(
                  shape: ArcShape(
                      direction: ArcDirection.Outside,
                      height: 20,
                      position: ArcPosition.Right
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(image: AssetImage('assets/Derm.jpg'),fit: BoxFit.fitWidth,),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        child: Text("Dermatology",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ClinicsDermatology()));
                        },
                      ),
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
