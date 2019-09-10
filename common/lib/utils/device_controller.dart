import 'dart:convert';

import 'package:common/models/device/common_device_info.dart';
import 'package:common/utils/remote_config.dart';
import 'package:common/utils/trusted_http.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';
import 'package:http/http.dart';

class DeviceController {

  static Future<CommonDeviceInfo> getDeviceInfo() async {
    String fcmToken = await FirebaseMessaging().getToken();
    String deviceId = "";
    CommonDeviceInfo commonDeviceInfo;
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
      deviceId = info.id;
      commonDeviceInfo = CommonDeviceInfo.named(
          id: info.id, fcmToken: fcmToken, deviceId: deviceId,deviceModel: info.model,deviceType: info.type);
    }
    else {
      IosDeviceInfo info = await DeviceInfoPlugin().iosInfo;
      deviceId = info.identifierForVendor;
    }

    commonDeviceInfo = CommonDeviceInfo.named(
        id: deviceId, fcmToken: fcmToken, deviceId: deviceId);
    return commonDeviceInfo;
  }

  static Future<bool> updateData() async {
    String fcmToken = await FirebaseMessaging().getToken();
    String deviceId = "";
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
      deviceId = info.id;
    }
    else {
      IosDeviceInfo info = await DeviceInfoPlugin().iosInfo;
      deviceId = info.identifierForVendor;
    }
    CommonDeviceInfo commonDeviceInfo = CommonDeviceInfo.named(
        id: "", fcmToken: fcmToken, deviceId: deviceId);
    String query = '''
      mutation {
   updateInstallation(input:{
    userId:""
    fcmToken:"$fcmToken"
    deviceId:"$deviceId"
    deviceWidth:0.0
    deviceHeight:0.0
    deviceType:ANDROID
    deviceCountry:"India"
    deviceBrand:""
    deviceModel:""
    deviceLocale:""
    buildNumber:""
    timeZone:""
    appName:"customer"
    appVersion:"45"
    badge:""
    deviceManufacturer:""
    systemVersion:""
    appIdentifier:""
  }){
    id
  }
}
    ''';
    TrustedHttp trustedHttp = TrustedHttp();
    Response response = await trustedHttp.post(
        RemoteConfig.BASE_URL, body: jsonEncode({"query": query}));
    print("Device Response ${response.body}");
    return false;
  }

}