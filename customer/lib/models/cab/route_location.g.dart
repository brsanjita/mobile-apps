// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteLocation _$RouteLocationFromJson(Map<String, dynamic> json) {
  return RouteLocation(
      (json['lat'] as num)?.toDouble(), (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$RouteLocationToJson(RouteLocation instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};
