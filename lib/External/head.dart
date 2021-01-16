import 'package:doctory/Doctory1/Start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ANF.dart';
import 'Hear.dart';
import 'Teath.dart';
import 'eye.dart';
import 'package:shape_of_view/shape_of_view.dart';
class head extends StatefulWidget {
  @override
  _headState createState() => _headState();
}

class _headState extends State<head> with SingleTickerProviderStateMixin {
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
            title: Text('Head Clinic',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
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
                      Image(image: AssetImage('assets/anf.jpg'),fit: BoxFit.fitWidth,),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        child: Text("Press",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ANf()));
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
                    Image(image: AssetImage('assets/hear.jpg'),fit: BoxFit.fitWidth,),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      child: Text("Press",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      color: Colors.lightBlue,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Hear()));
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
                    Image(image: AssetImage('assets/teath.jpg'),fit: BoxFit.fitWidth,),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      child: Text("Press",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      color: Colors.lightBlue,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Teath()));
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
                position: ArcPosition.Right,
              ),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(image: AssetImage('assets/eye.jpg'),fit: BoxFit.fitWidth,),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      child: Text("Press",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      color: Colors.lightBlue,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>eye()));
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
