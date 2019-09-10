import 'package:common/models/location_search/map_location.dart';
import 'package:flutter/material.dart';

import 'location_input_widget..dart';
import 'location_text_widget.dart';

class LocationInputColumn extends StatefulWidget {
  final Function(MapLocation from,MapLocation to) onSelected;
  const LocationInputColumn({Key key,  this.onSelected})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _LocationInputColumnState();
}

class _LocationInputColumnState extends State<LocationInputColumn> {
  MapLocation from,to;
  bool searching;
  bool fromFocus = false, toFocus = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 0.0, 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: LocationTextWidget(
                    text: '',
                    onLocationSelected: (val){
                      this.from=val;
                      widget.onSelected(this.from,this.to);
                    },
                    hint: "Enter your pickup location.",
                  )),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.transparent,
                ),
                onPressed: null,
                color: Colors.transparent,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: LocationTextWidget(
                    text: '',
                    hint: "Where to?",
                    onLocationSelected: (val){
                        this.to=val;
                        widget.onSelected(this.from,this.to);
                    },
                  ),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: () {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}
