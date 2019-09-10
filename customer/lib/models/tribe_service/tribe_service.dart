import 'package:json_annotation/json_annotation.dart';

part 'tribe_service.g.dart';

@JsonSerializable()
class TribeService{

  String id;
  String name;
  String icon;
  String category;
  String display;

  TribeService(this.id, this.name, this.icon, this.category, this.display);

  TribeService.named({this.id, this.name, this.icon, this.category, this.display});

  Map<String,dynamic> toJson()=>_$TribeServiceToJson(this);

  factory TribeService.fromJson(json)=>_$TribeServiceFromJson(json);
}