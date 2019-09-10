import 'package:flutter/material.dart';

class BookDeliveryScreen extends StatefulWidget {
  @override
  _BookDeliveryScreenState createState() => _BookDeliveryScreenState();
}

class _BookDeliveryScreenState extends State<BookDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Offers & Promotions"),
        ),
        body: Container(
          child: Center(
            child: Text(
              'Tribe',
              style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 70.00),
            ),
          ),
        ));
  }
}
