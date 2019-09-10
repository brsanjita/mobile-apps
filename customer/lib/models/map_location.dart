import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_location.g.dart';

@JsonSerializable()
class MapLocation {
  String main_text;
  String secondary_text;
  String id;

  MapLocation(this.main_text, this.secondary_text, this.id);

  factory MapLocation.fromJson(Map<String, dynamic> json) => _$MapLocationFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$MapLocationToJson(this);

}
