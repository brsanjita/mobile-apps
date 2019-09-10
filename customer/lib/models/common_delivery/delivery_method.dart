import 'package:customer/models/common_delivery/delivery_type.dart';

class DeliveryMethod{

  String title;
  String description;
  List<DeliveryType>deliveryTypes;

  DeliveryMethod(this.title, this.description, this.deliveryTypes);

  DeliveryMethod.name({this.title, this.description, this.deliveryTypes});

}

