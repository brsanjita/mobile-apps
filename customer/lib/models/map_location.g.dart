// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapLocation _$MapLocationFromJson(Map<String, dynamic> json) {
  return MapLocation(json['main_text'] as String,
      json['secondary_text'] as String, json['id'] as String);
}

Map<String, dynamic> _$MapLocationToJson(MapLocation instance) =>
    <String, dynamic>{
      'main_text': instance.main_text,
      'secondary_text': instance.secondary_text,
      'id': instance.id
    };
