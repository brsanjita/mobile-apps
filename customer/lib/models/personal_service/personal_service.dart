
import 'package:customer/widgets/custom_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PersonalServiceProvider extends CustomMapData{
  String title;
  String icon;
  LatLng position;
  String id;

  PersonalServiceProvider({this.title, this.icon, this.position, this.id}) : super( id,title, position, icon);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PersonalServiceProvider &&
              runtimeType == other.runtimeType &&
              title == other.title;

  @override
  int get hashCode => title.hashCode;

}