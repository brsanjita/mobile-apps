import 'dart:convert';
import 'package:common/models/cab/route.dart';
import 'package:common/models/cab/route_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class LocationController{

  static const String LOCATION_KEY="location_key";
  static const String apiKey="AIzaSyDUvdeaVmI37kTsButAN_mZJfbIuTn0I6M";
  static const String baseUrl="https://maps.googleapis.com/maps/api/directions/json";
  static Future<String> getAddress(LatLng position)async{
    String apiUrl="https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude}, ${position.longitude}&key=$apiKey";
    print(apiUrl);
    http.Response response=await http.get(apiUrl);
    var json=jsonDecode(response.body);
    print("Geocoding ${response.body}");
    var results=json['results'];
    if(results!=null&&results is List&&results.length>0){
      var address=results[0]["formatted_address"];
      if(address!=null){
        return address;
      }
    }
    return "Unknown Place";
  }
  static Future<LatLng> getLocation()async{
    Location location=Location();
    LocationData locationData = await location.getLocation();
    return LatLng(locationData.latitude, locationData.longitude);
  }
  static Future<String> getCurrentAdress()async{
    LatLng currentLocation=await getLocation();
    String address=await getAddress(currentLocation);
    return address;
  }
  static Future<List<RouteLocation>> getRoutes(String start,String end)async{
    String url=baseUrl+"?origin=$start&destination=$end&key=$apiKey";
    print(url);
    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);
    var routes=json['routes'];
    if(routes!=null&&routes is List&&routes.length>0){
      var legs=routes[0]["legs"];
      if(legs==null||legs.length==0){
        return [];
      }
      var steps=legs[0]["steps"];
      var result= List<Route>.from(steps.map((val)=>Route.fromJson(val)));
      print("Result ${result.length}");
      List<RouteLocation>points=[];
      result.forEach((val){
        points.add(val.startLocation);
      });
      if(result.length>0){
        points.add(result[result.length-1].endLocation);
        return points;
      }

    }
    return [];
  }
}