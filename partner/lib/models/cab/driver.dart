import 'package:json_annotation/json_annotation.dart';

part 'driver.g.dart';

@JsonSerializable()

class Driver{

  String id;
  String name;
  String phoneNumber;
  double reviews;
  int reviewCount;

  Driver(this.id, this.name, this.phoneNumber, this.reviews, this.reviewCount);

  Map<String,dynamic> toJson()=>_$DriverToJson(this);

  factory Driver.fromJson(Map<String,dynamic>json)=>_$DriverFromJson(json);
}