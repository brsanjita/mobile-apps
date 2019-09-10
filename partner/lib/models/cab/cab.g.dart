// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cab _$CabFromJson(Map<String, dynamic> json) {
  return Cab(
      json['id'] as String,
      json['name'] as String,
      json['isActive'] as bool,
      json['location'] == null
          ? null
          : DriverLocation.fromJson(json['location'] as Map<String, dynamic>),
      json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CabToJson(Cab instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isActive': instance.isActive,
      'location': instance.location,
      'driver': instance.driver
    };
