import 'package:common/widgets/ease_in_widget.dart';
import 'package:customer/models/common_delivery/delivery_type.dart';
import 'package:customer/screens/cab/book_cab_screen.dart';
import 'package:customer/screens/cab/cab_location_search_screen.dart';
import 'package:customer/screens/common_delivery/common_delivery_booking_screen.dart';
import 'package:flutter/material.dart';

class DeliveryTypeWidget extends StatelessWidget {
  final DeliveryType type;

  const DeliveryTypeWidget({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EaseInWidget(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CabLocationSearchScreen(
              scheduledTime: null,
              onSelected: (from, to, time) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CommonDeliveryBookingScreen(
                          from: from,
                          to: to,
                          scheduledTime: time,
                        )));
              });
        }));
      },
      child: Container(
        padding: EdgeInsets.all(6.0),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(type.thumbnail),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "${type.title}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "${type.description}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
