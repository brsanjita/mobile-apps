
import 'package:common/models/location_search/map_location.dart';
import 'package:common/utils/location_controller.dart';
import 'package:common/widgets/location_search/location_picker_map.dart';
import 'package:flutter/material.dart';

class PickLocationWidget extends StatelessWidget {
  final Function(MapLocation) onLocationSelected;
  const PickLocationWidget({Key key,@required this.onLocationSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        waitForLocation(context);
      },
      leading: IconButton(icon: Icon(Icons.location_on), onPressed: (){}),
      title: Text("Set location on map"),
      trailing: IconButton(icon: Icon(Icons.chevron_right), onPressed: (){}),
    );
  }
  void waitForLocation(BuildContext context)async{

    var data=await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocationPickerMap()));
    if(data!=null){
      MapLocation mapLocation=data[LocationController.LOCATION_KEY];
      print("Map Location $mapLocation");
      onLocationSelected(mapLocation);
    }
  }
}