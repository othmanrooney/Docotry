import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctory/Doctory1/singleTips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tipspage extends StatefulWidget {
  @override
  _TipspageState createState() => _TipspageState();
}

class _TipspageState extends State<Tipspage> {
  final type= ["General","Sport","Dietary","LifeTime","Psychologically"];
  String dropdownValue ="General";
    final titletext=TextEditingController();
    final desc=TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final Firref=FirebaseFirestore.instance.collection('tips');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey,
          title: Text('Tips page'),
          centerTitle: true,
          elevation: 17,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('tips').snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                shrinkWrap: true,
                itemCount:snapshot.data.docs.length,
                itemBuilder: (context, int index){
                  var tips=snapshot.data.docs[index];
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleTips(name: tips['Titletips'],type: tips['type'],desc: tips['DescTips'],)));
                          },
                          child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                      child: Container(
                          decoration: BoxDecoration(color: Colors.brown.shade600),
                          child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(width: 1.0, color: Colors.white24))),
                                child: Icon(Icons.nature_people, color: Colors.white),
                              ),
                              title: Expanded(
                                child: Text(tips['Titletips'],
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                              subtitle: Row(
                                children: <Widget>[
                                  Icon(Icons.accessibility_new, color: Colors.yellowAccent),
                                  Text(tips['type'], style: TextStyle(color: Colors.white))
                                ],
                              ),
                              trailing:
                              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
                      ), ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            else
              return CircularProgressIndicator();

          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: () {
           return showModalBottomSheet(
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
            isScrollControlled: true,
              context: context,
              builder: (BuildContext bc){
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: new Wrap(
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(19.0),
                              child: Container(
                                height:80.0,
                                width: 150.0,
                                child: TextFormField(
                                    key: const ValueKey('tipss'),
                                  cursorColor: Colors.lightBlue,
                                  controller: titletext,
                                  style: TextStyle( decoration: TextDecoration.none),
                                  decoration: InputDecoration(
                                    labelText: "Title Tips ",
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),

                                  ),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Title Tips';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: DropdownButtonFormField(
                                value: dropdownValue ,
                                icon: Icon(Icons.arrow_downward),
                                decoration: InputDecoration(
                                  labelText: "Select Doctor Type",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                items: type.map((String value) {
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
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: TextFormField(
                                key: const ValueKey('testdesc'),
                                controller: desc,
                                decoration: InputDecoration(

                                  border: InputBorder.none,
                                  labelText: "Description Tips",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                ),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Description Tips';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),

                          SizedBox(height: 60,),
                          Center(
                            child: Row(
                              children: [
                                Expanded(

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OutlineButton(
                                      onPressed: ()async {
                                      if(_formKey.currentState.validate()){
                                        Firref.add({
                                          'Titletips':titletext.text,
                                          'DescTips': desc.text,
                                          'type':dropdownValue,
                                        }).then((_) {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(content: Text('Successfully Added')));
                                          titletext.clear();
                                          desc.clear();
                                          type.clear();
                                        })..catchError((onError) {
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(content: Text(onError)));
                                        });
                                      }
                                      },
                                      color: Colors.blueGrey,
                                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                      child: Text("Submit",style: TextStyle(color: Colors.lightBlue),),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OutlineButton(
                                      color: Colors.red,
                                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                      child: Text("finish",style: TextStyle(color: Colors.lightBlue),),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );},
          child: Icon(
            Icons.add_comment,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
