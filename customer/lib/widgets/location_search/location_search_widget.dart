import 'package:customer/models/map_location.dart';
import 'package:customer/utils/search_controller.dart';
import 'package:flutter/material.dart';

import 'location_widget.dart';

class LocationSearch extends StatefulWidget {
  final String query;
  final Function(MapLocation) onLocationSelected;
  const LocationSearch({Key key,@required this.query,@required this.onLocationSelected}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SearchController.searchLocation(widget.query),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }
        List<MapLocation> cities = snapshot.data;
        return ListView.builder(
          itemBuilder: (context,index){
            if(index==0)
              return ListTile(title: Text("Search Results",style:TextStyle(fontWeight:FontWeight.w500,fontSize: 18.0)),);
            return LocationWidget(location:cities[index-1],onTap:(location)=>widget.onLocationSelected(location));
          },
          itemCount: cities.length+1,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
        );
      },
    );
  }
}
