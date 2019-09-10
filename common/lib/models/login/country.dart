import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country{
  String id;
  String countryName;
  String code;
  String phoneCode;
  String emergencyNumber;
  String tax;
  bool status;


  Country(this.id, this.countryName, this.code, this.phoneCode,
      this.emergencyNumber, this.tax, this.status);


  Country.name({this.id, this.countryName, this.code, this.phoneCode,
    this.emergencyNumber, this.tax, this.status});

  Map<String,dynamic> toJson()=>_$CountryToJson(this);

  factory Country.fromJson(Map<String,dynamic>json)=>_$CountryFromJson(json);
}