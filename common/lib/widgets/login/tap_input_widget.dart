import 'dart:math';

import 'package:flutter/material.dart';

class TapInputWidget extends StatefulWidget {
  final String label;
  final String value;
  final Function() onTap;

  const TapInputWidget({Key key,@required this.label,@required this.value,@required this.onTap}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TapInputWidgetState();

}

class _TapInputWidgetState extends State<TapInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
      child: Stack(
        children: <Widget>[
          TextField(
              controller: TextEditingController(text: widget.value),
              decoration: InputDecoration(
                  labelText: widget.label,
                  hasFloatingPlaceholder: true,
                  border: OutlineInputBorder(),
                  suffixIcon: Transform.rotate(
                      angle: pi / 2, child: Icon(Icons.chevron_right)))),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: 60.0,
              color: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }

}