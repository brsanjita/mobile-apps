import 'package:json_annotation/json_annotation.dart';

part 'driver_location.g.dart';

@JsonSerializable()
class DriverLocation{

  double latitude;
  double longitude;

  DriverLocation(this.latitude, this.longitude);

  Map<String,dynamic> toJson()=>_$DriverLocationToJson(this);

  factory DriverLocation.fromJson(Map<String,dynamic>json)=>_$DriverLocationFromJson(json);
}