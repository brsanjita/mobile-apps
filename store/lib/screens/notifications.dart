import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Center(child: 
                    Text("YOU HAVE  NEW ORDERS")
          ,)
        ],
      ),
    ),
    );
  }
}