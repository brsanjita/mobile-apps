import 'driver.dart';
import 'driver_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cab.g.dart';

@JsonSerializable()
class Cab{

  String id;
  String name;
  bool isActive;
  DriverLocation location;
  Driver driver;

  Cab(this.id, this.name, this.isActive, this.location, this.driver);


}
