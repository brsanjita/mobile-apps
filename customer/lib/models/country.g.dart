// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
      json['id'] as String,
      json['countryName'] as String,
      json['code'] as String,
      json['phoneCode'] as String,
      json['emergencyNumber'] as String,
      json['tax'] as String,
      json['status'] as bool);
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'countryName': instance.countryName,
      'code': instance.code,
      'phoneCode': instance.phoneCode,
      'emergencyNumber': instance.emergencyNumber,
      'tax': instance.tax,
      'status': instance.status
    };
