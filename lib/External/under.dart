
import 'package:doctory/External/Other.dart';
import 'package:doctory/External/foot.dart';
import 'package:doctory/INTERNAL/ClinicsUrology.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class under extends StatefulWidget {
  @override
  _underState createState() => _underState();
}

class _underState extends State<under> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 2), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: (
            AppBar(
              title: Text('Clinic',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              centerTitle: true,
            )),
        body: ScaleTransition(
          scale: _animation,
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
                      Image(image: AssetImage('assets/bowl.jpg'),fit: BoxFit.fitWidth,),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        child: Text("Urologist and Sexual Urologist",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ClinicsUrology()));
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
                      Image(image: AssetImage('assets/foot.jpg'),fit: BoxFit.fitWidth,),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        child: Text("Podiatrist",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Foot()));
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
                      Image(image: AssetImage('assets/other.jpg'),fit: BoxFit.fitWidth,),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        child: Text("General Practitioner",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>other()));
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
