import 'package:common/models/cab/route_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route.g.dart';

@JsonSerializable()
class Route{

  @JsonKey(name: "start_location")
  RouteLocation startLocation;
  @JsonKey(name: "end_location")
  RouteLocation endLocation;

  Route(this.startLocation, this.endLocation);

  Map<String,dynamic> toJson()=>_$RouteToJson(this);

  factory Route.fromJson(json)=>_$RouteFromJson(json);
}