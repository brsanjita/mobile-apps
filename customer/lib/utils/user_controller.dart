import 'dart:convert';


import 'package:common/models/user/mobile_number.dart';
import 'package:common/models/user/user.dart';
import 'package:customer/utils/remote_config.dart';
import 'package:common/utils/trusted_http.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class UserController {
  static Future<LatLng> getLocation() async {
    Location location = Location();
    bool hasPermission = await location.requestPermission();
    if (!hasPermission) {
      return LatLng(0.0, 0.0);
    }
    LocationData locationData = await location.getLocation();
    return LatLng(locationData.latitude, locationData.longitude);
  }

  static Future<bool> signUpWithEmail(User user,String password) async{
    String query = '''
    mutation{
      signUpWithEmail(input:{
        firstName:"${user.firstName}",
        lastName:"${user.lastName}",
        email:"${user.email}",
        password:"$password",
        gender:"${user.gender}",
        mobileNo:"${user.mobileNo}",
        country:"India",
        state:"Delhi",
        city:"Delhi",
      }){
        token
      }
    } ''';
    TrustedHttp trustedHttp=TrustedHttp();
    http.Response response=await trustedHttp.post(RemoteConfig.BASE_URL,body: jsonEncode({"query":query}));
    print("User ${response.body}");
    var json=jsonDecode(response.body);
    if(json["data"]==null){
      return false;
    }
    if(json['data']['signUpWithEmail']==null){
      return false;
    }
    var token=json['data']['signUpWithEmail']["token"];
    if(token!=null){
      TrustedHttp.saveToken(token);
    }
    return  token!=null;
  }
  static Future<bool> requestOTP(MobileNumber mobileNumber)async{
    String query = '''
    mutation{
      requestLoginOTP(mobileNo:"$mobileNumber")
    } ''';
    TrustedHttp trustedHttp=TrustedHttp();
    http.Response response=await trustedHttp.post(RemoteConfig.BASE_URL,body: jsonEncode({"query":query}));
    var json=jsonDecode(response.body);
    return false;
  }
  static Future<bool> verifyOTP(MobileNumber mobileNumber,String otp)async{
    String query = '''
    mutation{
      requestLoginOTP(mobileNo:"$mobileNumber")
    } ''';
    TrustedHttp trustedHttp=TrustedHttp();
    http.Response response=await trustedHttp.post(RemoteConfig.BASE_URL,body: jsonEncode({"query":query}));
    var json=jsonDecode(response.body);
    return false;
  }
  static Future<bool> loginWithEmail(String email, String password) async{
    print("Email $email Password $password");
    String query = '''
    mutation{
      loginWithCredentials(email:"$email",password:"$password"){
        token
      }
    } ''';
    TrustedHttp trustedHttp=TrustedHttp();
    http.Response response=await trustedHttp.post(RemoteConfig.BASE_URL,body: jsonEncode({"query":query}));
    print("User ${response.body}");
    var json=jsonDecode(response.body);
    if(json["data"]==null){
      return false;
    }
    if(json['data']['loginWithCredentials']==null){
      return false;
    }
    var token=json['data']['loginWithCredentials']["token"];
    if(token!=null){
      TrustedHttp.saveToken(token);
    }
    return  token!=null;
  }
}
