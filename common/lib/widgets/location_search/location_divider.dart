import 'package:flutter/material.dart';

class LocationDivider extends StatelessWidget {
  final String title;

  const LocationDivider({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black,fontSize: 18.0),
          )),
    );
  }

}