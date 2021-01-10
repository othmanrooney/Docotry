import 'package:geolocator/geolocator.dart';

class Location {
  String latitude ="";
  String longitude="";

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
    } catch (e) {
      print(e);
    }
  }
}