import 'package:customer/utils/location_controller.dart';
import 'package:customer/widgets/location_search/location_input_widget..dart';
import 'package:customer/widgets/location_search/location_search_widget.dart';
import 'package:customer/widgets/pick_location_widget.dart';
import 'package:flutter/material.dart';

class LocationInputScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationInputScreenState();

}

class _LocationInputScreenState extends State<LocationInputScreen> {
  String location="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Location"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 4.0),
              child: LocationInputWidget(
                hint: "Enter location",
                initialText: location,
                onChanged: (val){
                  setState(() {
                    this.location=val;
                  });
                },
                onSubmitted: (val){},
              ),
            ),
            searching?LocationSearch(query: this.location,onLocationSelected: (location){
              Navigator.of(context).pop({LocationController.LOCATION_KEY:location});
            },):Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Divider(),PickLocationWidget(
                onLocationSelected: (location){
                  Navigator.of(context).pop({LocationController.LOCATION_KEY:location});
                },
              ),
              ]
            )
          ],
        ),
      ),
    );
  }
  bool get searching=>location.length!=0;
}