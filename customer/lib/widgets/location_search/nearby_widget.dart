import 'dart:typed_data';
import 'dart:ui';

import 'package:customer/screens/cab/location_picker_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pick_location_widget.dart';
import 'add_location_widget.dart';
import 'location_divider.dart';
import 'location_pick_map.dart';

class NearbyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NearbyWidgetState();

}

class _NearbyWidgetState extends State<NearbyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        LocationDivider(title: "Favourite Location",),
        AddLocationWidget(
          icon: Icons.home,
          label: "Home",
        ),
        AddLocationWidget(
          icon: Icons.work,
          label: "Work",
        ),
      ],
    );
  }

}