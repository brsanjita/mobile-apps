import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
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

class OrderStatusScreen extends StatefulWidget {
  @override
  _OrderStatusScreenState createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Status"),
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



class ManageProfilesScreen extends StatefulWidget {
  @override
  _ManageProfilesScreenState createState() => _ManageProfilesScreenState();
}

class _ManageProfilesScreenState extends State<ManageProfilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Manage Profiles"),
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

class ManageAddressScreen extends StatefulWidget {
  @override
  _ManageAddressScreenState createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Manage Address"),
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
