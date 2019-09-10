import 'package:common/utils/device_controller.dart';
import 'package:common/utils/trusted_http.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

  Future open()async{
  await TrustedHttp.initTrustedClient();
  DeviceController.updateData();
  FirebaseMessaging instance=FirebaseMessaging();
  instance.onTokenRefresh.listen((String token){
    DeviceController.updateData();
  });
}