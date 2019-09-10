import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help"),
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
