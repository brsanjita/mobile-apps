import 'package:flutter/material.dart';

class HeaderLocationPickerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeaderLocationPickerWidgetState();
}

class _HeaderLocationPickerWidgetState
    extends State<HeaderLocationPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Location for availing service",
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  "2nd Floor, 69 Regal Building, Connaught Place, New Delhi,Delhi 110001,India",
                  style: TextStyle(fontSize: 14.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.keyboard_arrow_down),onPressed: (){},)
        ],
      ),
    );
  }
}
