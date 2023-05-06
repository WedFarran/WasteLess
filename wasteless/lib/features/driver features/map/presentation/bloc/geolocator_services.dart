import 'package:geolocator/geolocator.dart';

class GeolocatorServices {
  Stream<Position> getCurrentLocation() {
    var locationOptions = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 10);
    return Geolocator.getPositionStream(locationSettings: locationOptions);
  }

  Future<Position> getInitalLocation() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
