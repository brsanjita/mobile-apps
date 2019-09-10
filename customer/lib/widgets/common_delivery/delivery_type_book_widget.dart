import 'package:flutter/material.dart';

class DeliveryTypeBookWidget extends StatelessWidget {
  final String name;
  final double price;

  const DeliveryTypeBookWidget({Key key, this.name, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          constraints:
          BoxConstraints(minWidth: MediaQuery.of(context).size.width / 5),
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.all(8.0),
          child: Icon(
            Icons.local_taxi,
            color: Colors.white,
            size: 22.0,
          ),
          padding: EdgeInsets.all(12.0),
        ),
        Text(
          name,
          style: TextStyle(fontSize: 14.0),
        ),
        Text(
          "\$ $price",
          style: TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

}