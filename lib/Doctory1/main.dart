
import 'package:doctory/Services/Auth.dart';
import 'package:doctory/module/User.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Start.dart';
import 'doctorform.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      value: AuthServices().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Poppins',
            backgroundColor: Color(0xFF64FFDA),
            secondaryHeaderColor: Colors.white,
        ),
        home: StatrPage(),
      ),
    );
  }
}



