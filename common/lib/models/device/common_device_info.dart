import 'package:json_annotation/json_annotation.dart';

part 'common_device_info.g.dart';

@JsonSerializable()
class CommonDeviceInfo{
  String id;
  String userId;
  String fcmToken;
  String deviceId;
  String deviceType;
  String deviceCountry;
  String deviceModel;
  String deviceBrand;
  String buildNumber;
  String deviceLocale;
  String appName;

  CommonDeviceInfo(this.id, this.userId, this.fcmToken, this.deviceId);


  CommonDeviceInfo.named({this.id, this.userId, this.fcmToken, this.deviceId,
    this.deviceType, this.deviceCountry, this.deviceModel, this.deviceBrand,
    this.buildNumber, this.deviceLocale, this.appName});

  factory CommonDeviceInfo.fromJson(json)=>_$CommonDeviceInfoFromJson(json);

  Map<String,dynamic> toJson()=>_$CommonDeviceInfoToJson(this);
}