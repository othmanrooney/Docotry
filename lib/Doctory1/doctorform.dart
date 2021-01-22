import 'dart:io';
import 'package:doctory/Doctory1/login.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


class docform extends StatefulWidget {
  @override
  _docformState createState() => _docformState();
}

class _docformState extends State<docform> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final listdoc= ["Select","Cardiology","Dermatology","Hematology",
    "ClinicsNerves","Neurology","Oncology","Pediatric",
    "Urology","ear-nose-throat","EYE","Dental Clinics","sexual-health-clinic","hear",
    "Physical therapy"," nutrition_specialist","Foot","Other"];

  Future getimage()async{
  PickedFile pickfile = await ImagePicker().getImage(source: ImageSource.gallery);
  File imagefile=File(pickfile.path);
  String filename=basename(imagefile.path);
  uploadImage(imagefile,filename);
  }
  void uploadImage(File file,String filename)async{
    Reference storagerefernce=FirebaseStorage.instance.ref().child(filename);
    storagerefernce.putFile(file).whenComplete(() => CircularProgressIndicator()).then((firebaseFile)async{
      var downloadurl=await firebaseFile.ref.getDownloadURL();
      String urlfile=firebaseFile.ref.fullPath.toString();
      setState(() {
       _imgurl=downloadurl;
       print(_imgurl);
       print("this is url : "+urlfile);
      });
    });
  }
  String lat;
  String long;
     Future<double> _getCurrnetLocationlongitude()async{
     final position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     print(position.longitude);
     long = position.longitude.toString();
      return position.longitude;
  }
  Future <double> _getCurrnetLocationlatitude()async{
    final position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat =position.latitude.toString();
    print(position.latitude);
    return position.latitude;
  }
        var _imgurl;
          String dropdownValue ="Select";
            final nameController=TextEditingController();
             final phoneNumbercontroller=TextEditingController();
              String mapcontroller;
               final destinationcontroller=TextEditingController();
                final clinicname=TextEditingController();
                  final Desc=TextEditingController();
                   final  Scout=TextEditingController();
                    final email=TextEditingController();


        final dbRef =FirebaseDatabase.instance.reference().child("doc");
        final Firref=FirebaseFirestore.instance.collection('user');
  AnimationController _animationController;
  bool isPlaying = false;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctory Info",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/infopage.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child:   Text("Please Fill Your Info ",
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.italic,
                          shadows:[
                            Shadow(
                              color:Colors.lightBlue,
                              blurRadius: 20.0,
                              offset: Offset(0,10),
                            ),
                          ]
                      )),
                ),

                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                    Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Enter Doctor Name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Doctor Name';
                        }
                        return null;
                      },
                    ),
                  ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                labelText: "Enter Doctor email",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter Doctor email';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: phoneNumbercontroller,
                              decoration: InputDecoration(
                                labelText: "Enter Doctor Phone number",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter Doctor Phone number';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: DropdownButtonFormField(
                              value: dropdownValue ,
                              icon: Icon(Icons.arrow_downward),
                              decoration: InputDecoration(
                                labelText: "Select Doctor Type",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              items: listdoc.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue  = newValue;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Select a Type';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: destinationcontroller,
                              decoration: InputDecoration(
                                labelText: "Enter Your Address",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter destination please';
                                }
                                return null;
                              },
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: clinicname,
                              decoration: InputDecoration(
                                labelText: "Enter Doctor Clinic name",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter Doctor Clinic name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: Desc,
                              decoration: InputDecoration(
                                labelText: "Description about You",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Description about You';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              controller: Scout,
                              decoration: InputDecoration(
                                labelText: "Fees \$",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'please insert your fees';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child:  Center(
                              child: _imgurl== null
                                  ? Text('No image selected.')
                                  :Image.network(_imgurl),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: RaisedButton(
                            onPressed: getimage,
                            child: Icon(Icons.add_a_photo),
                          ),
                ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: FlatButton.icon(onPressed: () {
                          setState(() {
                            print("the  locater : "+_getCurrnetLocationlatitude().toString());
                            print("the locatores : "+_getCurrnetLocationlongitude().toString());
                            mapcontroller="https://www.google.com/maps/search/?api=1&query=$lat,$long";
                            print("the map : "+mapcontroller);
                            _handleOnPressed();
                          });
                            }, icon: AnimatedIcon(
                              icon: AnimatedIcons.play_pause,
                              progress: _animationController,
                              color: Colors.blue.shade900,
                              size: 30.0,
                            ), label: lat==null&&long==null?Text("Tap 5 times To get Your location"):Text("Done")),
                          ),
                          Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  RaisedButton(
                                    color: Colors.lightBlue,
                                    onPressed: ()async{
                                      if(long==null&&lat==null){
                                        showDialog(context: context, child:
                                        new AlertDialog(
                                          title: new Text("Location error"),
                                          content: new Text("Double click to get your location"),
                                        )
                                        );
                                      }
                                      else if(_imgurl==null){
                                        showDialog(context: context, child:
                                        new AlertDialog(
                                          title: new Text("Image Info : "),
                                          content: new Text("upload another (JPG)image or wait "),
                                        )
                                        );
                                      }
                                      else if (_formKey.currentState.validate()){
                                        Firref.add(
                                            {
                                              "name": nameController.text,
                                              "phone": phoneNumbercontroller.text,
                                              "dist":destinationcontroller.text,
                                              "map":mapcontroller,
                                              "type": dropdownValue,
                                              "clincname":clinicname.text,
                                              "image":_imgurl,
                                              "Desc":Desc.text,
                                              'fees':Scout.text,
                                              'email':email.text,
                                            }
                                        ).then((_) {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(content: Text('Successfully Added')));
                                          phoneNumbercontroller.clear();
                                          nameController.clear();
                                          destinationcontroller.clear();

                                        }).catchError((onError) {
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(content: Text("no repeat it ")));
                                        });
                                        // dbRef.push().set({
                                        //   "name": nameController.text,
                                        //   "phone": phoneNumbercontroller.text,
                                        //   "dist":destinationcontroller.text,
                                        //   "map":mapcontroller.text,
                                        //   "type": dropdownValue,
                                        //   "clincname":clinicname.text,
                                        //   "image":_imgurl,
                                        //
                                        // }).then((_) {
                                        //   Scaffold.of(context).showSnackBar(
                                        //       SnackBar(content: Text('Successfully Added')));
                                        //   phoneNumbercontroller.clear();
                                        //   nameController.clear();
                                        //   destinationcontroller.clear();
                                        //   mapcontroller.clear();
                                        // }).catchError((onError) {
                                        //   Scaffold.of(context)
                                        //       .showSnackBar(SnackBar(content: Text(onError)));
                                        // });
                                        showDialog(context: context, child:
                                        new AlertDialog(
                                          title: new Text("My Contact : "+nameController.text),
                                          content: new Text("Yes completed"),
                                        )
                                        );
                                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                            login()), (Route<dynamic> route) => false);
                                      }


                                    },
                                    child: Text('Submit'),
                                  ),
                                  RaisedButton(
                                    color: Colors.amber,
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                          login()), (Route<dynamic> route) => false);
                                    },
                                    child: Text('Navigate'),
                                  ),
                                ],
                              )),

                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}
