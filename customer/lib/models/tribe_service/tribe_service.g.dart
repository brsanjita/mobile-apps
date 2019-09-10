// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tribe_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TribeService _$TribeServiceFromJson(Map<String, dynamic> json) {
  return TribeService(
      json['id'] as String,
      json['name'] as String,
      json['icon'] as String,
      json['category'] as String,
      json['display'] as String);
}

Map<String, dynamic> _$TribeServiceToJson(TribeService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'category': instance.category,
      'display': instance.display
    };
