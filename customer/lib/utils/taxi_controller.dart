import 'dart:math';

import 'package:common/models/taxi.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TaxiController {
  static Future<List<Taxi>> getTaxis(LatLng location) async {
    List<Taxi> taxis = [];
    Random random = Random();
    return taxis;
  }
  static Future<List<Taxi>> getCabs(LatLng location) async {
    return [
      Taxi.named(location: LatLng(0.0,0.0), plateNo: "Rx515",title: "Normal",price: 500.0,),
      Taxi.named(location: LatLng(0.0,0.0), plateNo: "Rx625",title: "Luxurious",price: 1000.0,),
      Taxi.named(location: LatLng(0.0,0.0), plateNo: "Rx153",title: "Pool",price: 300.0,),
    ];
  }
  static Future<List<Taxi>> getDeliveryTrucks(LatLng location) async {
    return [
      Taxi.named(location: LatLng(0.0,0.0), plateNo: "Rx515",title: "Big",price: 500.0,),
      Taxi.named(location: LatLng(0.0,0.0), plateNo: "Rx625",title: "Small",price: 1000.0,),
      Taxi.named(location: LatLng(0.0,0.0), plateNo: "Rx153",title: "Large",price: 300.0,),
    ];
  }
}
