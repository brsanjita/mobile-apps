import 'package:customer/models/map_location.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final MapLocation location;
  final Function(MapLocation) onTap;
  final bool recent;
  const LocationWidget({Key key, this.location, this.onTap, this.recent=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(location);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.location_on,size: 22.0,color: Colors.black54,),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${location.main_text}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Text("${location.secondary_text}",style: TextStyle(fontSize: 14.0,color: Colors.black54),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
//      ListTile(
//      onTap: onTap,
//      leading:  Icon(
//          !recent?Icons.location_on:Icons.history,
//          color: Colors.black45,
//          size:22.0
//      ),
//      title: Text(
//        location.main_text,
//        style: TextStyle(fontWeight: FontWeight.w600),
//      ),
//      subtitle: Text(location.secondary_text,maxLines: 1,overflow: TextOverflow.ellipsis,),
//    );
  }
}
