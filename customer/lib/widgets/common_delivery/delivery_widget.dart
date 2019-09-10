import 'package:customer/models/common_delivery/delivery_method.dart';
import 'package:customer/models/common_delivery/delivery_type.dart';
import 'package:customer/screens/cab/book_cab_screen.dart';
import 'package:customer/screens/cab/cab_location_search_screen.dart';
import 'package:customer/widgets/common_delivery/delivery_type_widget.dart';
import 'package:customer/widgets/ease_in_widget.dart';
import 'package:flutter/material.dart';

class DeliveryWidget extends StatelessWidget {
  final DeliveryMethod delivery;

  const DeliveryWidget({Key key, @required this.delivery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              delivery.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              delivery.description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
                itemCount: delivery.deliveryTypes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DeliveryType type = delivery.deliveryTypes[index];
                  return DeliveryTypeWidget(type: type,);
                }),
          )
        ],
      ),
    );
  }
}
