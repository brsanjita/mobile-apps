import 'package:customer/models/map_location.dart';
import 'package:customer/utils/location_controller.dart';
import 'package:customer/widgets/linear_loader.dart';
import 'package:customer/widgets/location_search/location_pick_map.dart';
import 'package:flutter/material.dart';

class LocationPickerMap extends StatefulWidget {
  final Function(String)onAddressChanged;
  final Function(bool) onMoved;
  const LocationPickerMap({Key key,@required this.onAddressChanged,@required this.onMoved}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LocationPickerMapState();

}

class _LocationPickerMapState extends State<LocationPickerMap> {
  String address="Selecting Location";
  MapLocation location;
  bool loading=true;
  LocationPickController controller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((details){
      getCurrentLocation();
    });
  }
  void getCurrentLocation(){
    setState(() {
      this.loading=true;
    });
    LocationController.getLocation().then((position){
      LocationController.getAddress(position).then((address){
        this.address=address;
        setState(() {
          this.loading=false;
        });
        if(this.controller!=null){
          this.controller.moveTo(position);
        }
        widget.onAddressChanged(address);

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: loading?LinearLoader(height: 2.0,):Container(height:2.0), preferredSize: Size(MediaQuery.of(context).size.width, 2.0)),
      body: LocationPickupMap(
        controllerCompleted: (controller){
          this.controller=controller;
        },
        onPositionChanged: (position){
          widget.onMoved(true);
            setState(() {
               this.loading=true;
            });
            LocationController.getAddress(position).then((address){
             if(mounted){
               setState(() {
                 this.loading=false;
                 this.address=address;
                 widget.onAddressChanged(address);
               });
             }
           });
        },
      ),
//      bottomNavigationBar: RoundedButton("Add Location",onPressed: (){
//        Navigator.of(context).pop({LocationController.LOCATION_KEY:MapLocation(address,address,address)});
//      },color: Colors.black,),
    );
  }


}