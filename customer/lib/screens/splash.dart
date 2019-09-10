import 'dart:async';
import 'package:common/models/device/common_device_info.dart';
import 'package:common/utils/user_controller.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:customer/firebase_notification_handler.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    open();
  }

  Future open() async {
    await initializeFirebaseNotification();
    await checkLogin();
  }

  Future checkLogin() async {
    bool isLogin = await UserController.checkLogin();
    if (isLogin) {
      Navigator.of(context).pushNamed('/');
    } else {
      Navigator.of(context).pushNamed('/login');
    }
  }

  Future initializeFirebaseNotification() async {
    new FirebaseNotifications().setUpFirebase();
    //WidgetsBinding.instance.addObserver(this);
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

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

//  Future<void> _retrieveDynamicLink() async {
//    final PendingDynamicLinkData data =
//        await FirebaseDynamicLinks.instance.retrieveDynamicLink();
//    final Uri deepLink = data?.link;
//
//    if (deepLink != null) {
//      Navigator.pushNamed(context, deepLink.path);
//    } else {
//      Navigator.pushReplacementNamed(context, '/home');
//    }
//  }
  Future<CommonDeviceInfo> getDeviceInfo()async{
    FirebaseMessaging instance = FirebaseMessaging();

  }
  String createQuery() {

    return '''
      mutation getUpdateInstallation{
         updateInstallation(input:{
          userId:""
          fcmToken:""
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
      child: Mutation(
        options: MutationOptions(document: createQuery()),
        builder: (refetch, result) {
          print("Splash Result ${result.data}");
          return Center(
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
                    RoundedButton("Refresh",onPressed: ()=>refetch({}),)
              ]));
        },
        onCompleted: (val){
          print("Splash Result ${val}");
//          Navigator.of(context).pushNamed('/');
        },
      ),
    ));
  }

  // Method 1
  Future _showNotificationWithSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        sound: 'slow_spring_board',
        importance: Importance.Max,
        priority: Priority.High);
    var iOSPlatformChannelSpecifics =
        new IOSNotificationDetails(sound: "slow_spring_board.aiff");
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Custom_Sound',
    );
  }

// Method 2
  Future _showNotificationWithDefaultSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

// Method 3
  Future _showNotificationWithoutSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        playSound: false, importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics =
        new IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'No_Sound',
    );
  }
}
