class Tjordan {
  var cases;
  var deaths;
  var recovered;

  Tjordan({this.cases, this.recovered, this.deaths});

  factory Tjordan.fromJson(final json){
    return Tjordan(

      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}