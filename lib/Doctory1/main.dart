import 'package:flutter/material.dart';
import 'Start.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          backgroundColor: Color(0xFF64FFDA),
          secondaryHeaderColor: Colors.white,
      ),
      home: StatrPage(),
    );
  }
}



