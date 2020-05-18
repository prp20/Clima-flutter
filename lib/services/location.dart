import 'package:geolocator/geolocator.dart';

class Location {
  double Latitude;
  double Longitude;

  Future <void> currentLocation() async{
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      Latitude = position.latitude;
      Longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}
