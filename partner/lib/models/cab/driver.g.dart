// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
      json['id'] as String,
      json['name'] as String,
      json['phoneNumber'] as String,
      (json['reviews'] as num)?.toDouble(),
      json['reviewCount'] as int);
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'reviews': instance.reviews,
      'reviewCount': instance.reviewCount
    };
