import 'package:customer/models/common_delivery/delivery_method.dart';
import 'package:customer/models/common_delivery/delivery_type.dart';

class CommonDeliveryController {
  static Future<List<DeliveryMethod>> getMethods() async {
    return [
      DeliveryMethod.name(
          title: "Single Delivery",
          description:
              "With this feature you can send any item from one pickup point to a single destination! Send any item from any location to single point of delivery",
          deliveryTypes: [
            DeliveryType.name(
                title: "Box",
                description:
                    "Have a big parcel to send! Click right here and send it to a single destination",
                thumbnail:
                    "https://library.kissclipart.com/20181207/quq/kissclipart-cartoon-dump-truck-clipart-dump-truck-clip-art-d4c2a1813b13df59.jpg"),
            DeliveryType.name(
                title: "Moto Send",
                description:
                    "Have a big parcel to send! Click right here and send it to a single destination",
                thumbnail:
                    "https://www.infamous.ae/wp-content/uploads/revslider/retro-portfolio/bike.png"),
          ]),
      DeliveryMethod.name(
          title: "Multi Delivery",
          description:
              "With this feature you can send any item from one pickup point to a single destination! Send any item from any location to single point of delivery",
          deliveryTypes: [
            DeliveryType.name(
                title: "Box",
                description:
                    "Have a big parcel to send! Click right here and send it to a single destination",
                thumbnail:
                    "https://library.kissclipart.com/20181207/quq/kissclipart-cartoon-dump-truck-clipart-dump-truck-clip-art-d4c2a1813b13df59.jpg"),
            DeliveryType.name(
                title: "Moto Send",
                description:
                    "Have a big parcel to send! Click right here and send it to a single destination",
                thumbnail:
                    "https://www.infamous.ae/wp-content/uploads/revslider/retro-portfolio/bike.png"),
          ]),
    ];
  }
}
