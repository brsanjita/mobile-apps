import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/models/order.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  OrderDetailsScreen({Key key,  this.order}): super(key: key);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Center(child: Text("Order ID"+ order.id)
          ,)
        ],
      ),
    ),
    );
  }
}