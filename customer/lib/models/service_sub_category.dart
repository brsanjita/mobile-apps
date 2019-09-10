
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceSubCategory{
  String title;
  String icon;
  LatLng position;
  String id;


  ServiceSubCategory({this.title, this.icon, this.position, this.id});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ServiceSubCategory &&
              runtimeType == other.runtimeType &&
              title == other.title;

  @override
  int get hashCode => title.hashCode;

}