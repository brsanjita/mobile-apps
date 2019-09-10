// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Route _$RouteFromJson(Map<String, dynamic> json) {
  return Route(
      json['start_location'] == null
          ? null
          : RouteLocation.fromJson(json['start_location']),
      json['end_location'] == null
          ? null
          : RouteLocation.fromJson(json['end_location']));
}

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'start_location': instance.startLocation,
      'end_location': instance.endLocation
    };
