// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonDeviceInfo _$CommonDeviceInfoFromJson(Map<String, dynamic> json) {
  return CommonDeviceInfo(json['id'] as String, json['userId'] as String,
      json['fcmToken'] as String, json['deviceId'] as String);
}

Map<String, dynamic> _$CommonDeviceInfoToJson(CommonDeviceInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fcmToken': instance.fcmToken,
      'deviceId': instance.deviceId
    };
