import 'package:flutter/material.dart';

class AppSettingsScreen extends StatefulWidget {
  @override
  _AppSettingsScreenState createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Settings"),
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
