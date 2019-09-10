import 'package:common/widgets/map/custom_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

class Taxi extends CustomMapData {
  LatLng location;
  String title;
  String icon;
  double price;
  String plateNo;

  Taxi(this.location,this.plateNo, this.title, this.price):super(plateNo, title, location, 'assets/images/taxi.png');

  Taxi.named(
      {@required this.location, @required this.plateNo, this.title, this.price})
      : super(plateNo, title, location, 'assets/images/taxi.png');
}
