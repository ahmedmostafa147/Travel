import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Location {
  static Future<Map<String, dynamic>?> getCurrentPosition() async {
    // check the location permission
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // get the current location
    Position position = await Geolocator.getCurrentPosition();

    // get the address
    Future<String> getAddress(double latitude, double longitude) async {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          latitude, longitude,
          localeIdentifier: 'en');

      Placemark place = placemarks[0];

      return "${place.subAdministrativeArea} ${place.country}";
    }

    // save the address and coordinates to storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'address', await getAddress(position.latitude, position.longitude));
    await prefs.setDouble('latitude', position.latitude);
    await prefs.setDouble('longitude', position.longitude);

    return {
      'latitude': position.latitude,
      'longitude': position.longitude,
      'address': await getAddress(position.latitude, position.longitude)
    };
  }
}
