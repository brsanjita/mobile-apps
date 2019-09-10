import 'dart:core';
import 'dart:math';
import 'package:vector_math/vector_math.dart';

class MarkerRotation {
  static double getHeadingForDirection(
      LocationCoordinate fromLocation, LocationCoordinate toLocation) {
    final double fLat = radians(fromLocation.latitude);
    final double fLng = radians(fromLocation.longitude);
    final double tLat = radians(toLocation.latitude);
    final double tLng = radians(toLocation.longitude);
    double degree = radians(atan2(sin(tLng - fLng) * cos(tLat),
        cos(fLat) * sin(tLat) - sin(fLat) * cos(tLat) * cos(tLng - fLng)));
    if (degree >= 0) {
      return degree - 180.0;
    } else {
      return (360 + degree) - 180;
    }
  }
}

class LocationCoordinate {
  const LocationCoordinate({this.latitude, this.longitude});
  final double latitude;
  final double longitude;
}
