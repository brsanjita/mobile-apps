import 'dart:async';
import 'package:common/models/device/common_device_info.dart';
import 'package:common/utils/device_controller.dart';
import 'package:common/utils/user_controller.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    open();
  }

  Future open() async {
    deviceInfo=await DeviceController.getDeviceInfo();
    setState(() {

    });
  }

  Future checkLogin() async {
    bool isLogin = await UserController.checkLogin();
    if (isLogin) {
      Navigator.of(context).pushNamed('/');
    } else {
      Navigator.of(context).pushNamed('/login');
    }
  }

  CommonDeviceInfo deviceInfo;
  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }

  String createQuery() {
    return '''
      mutation getUpdateInstallation{
         updateInstallation(input:{
          userId:""
          fcmToken:"${deviceInfo.fcmToken}"
          deviceId:"${deviceInfo.deviceId}"
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: "logotext",
                      child: Text(
                        'tribe',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 70.00,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Let's get you moving!",
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 15.00,
                      ),
                    ),
                    deviceInfo==null?Container(width: 0.0,height: 0.0,):Mutation(
                      options: MutationOptions(document: createQuery(),),
                      builder: (refetch, result) {
                        if(!isLoading){
                          isLoading=true;
                          refetch({});
                        }
                        return Container(width: 0.0,height: 0.0,);
                      },
                      onCompleted: (val) {
                        checkLogin();
                      },
                    )
                  ])),

        ));
  }
  bool isLoading=false;
}
