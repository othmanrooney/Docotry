
import 'package:flutter/foundation.dart';

class Tcases{
  var cases;
  var deaths;
  var recovered;

  Tcases({this.cases,this.deaths,this.recovered});

  factory Tcases.fromJson(final json){

    return Tcases(

    cases: json['cases'],
    deaths: json['deaths'] ,
    recovered: json['recovered'],
    );
  }

}