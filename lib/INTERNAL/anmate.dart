import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ClinicsCardiology.dart';
import 'ClinicsDermatology.dart';
import 'ClinicsHematology.dart';
import 'ClinicsNerves.dart';
import 'ClinicsNeurology.dart';
import 'ClinicsOncology.dart';
import 'ClinicsPedistric.dart';
import 'ClinicsUrology.dart';
import 'background.dart';
import 'internal.dart';

void main() => runApp(AnimationDemo());

class AnimationDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home:
      MyHomePage(title:'INTERNAL MEDICINE'),

    );

  }
}

class MyHomePage extends StatefulWidget {


  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ScrollController _controller = new ScrollController();


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.lightBlue,
          appBar: AppBar(title: Center (
            child: Text(widget.title , style: TextStyle(fontSize: 20.0 ,color: Colors.white),),),
          ),
          body: Stack(
            fit: StackFit.expand,
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                AnimatedBackground(controller: _controller),
                Center(
                    child: ListView(
                      shrinkWrap: true,
                      controller: _controller,
                      children: [
                        DemoCard(),
                        ClinicsCardiology(),
                        ClinicsDermatology(),
                        ClinicsHematology(),
                        ClinicsPedistric(),
                        ClinicsNeurology(),
                        ClinicsUrology(),
                        ClinicsOncology(),
                      ],))] )),
    );}}

