import 'package:flutter/material.dart';

class OrdersFragment extends StatefulWidget {
  @override
  _OrdersFragmentState createState() => _OrdersFragmentState();
}

class _OrdersFragmentState extends State<OrdersFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Center(
              child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text("data"),
                  subtitle: Text("data"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("data"),
                  subtitle: Text("data"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("data"),
                  subtitle: Text("data"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("data"),
                  subtitle: Text("data"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("data"),
                  subtitle: Text("data"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("data"),
                  subtitle: Text("data"),
                ),
              )
            ],
          )),
        ));
  }
}
