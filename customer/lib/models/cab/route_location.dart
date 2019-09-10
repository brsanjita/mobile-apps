import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_location.g.dart';

@JsonSerializable()
class RouteLocation{
  double lat,lng;

  RouteLocation(this.lat, this.lng);

  Map<String,dynamic> toJson()=>_$RouteLocationToJson(this);

  factory RouteLocation.fromJson(json)=>_$RouteLocationFromJson(json);

  LatLng get location=>LatLng(lat, lng);
}