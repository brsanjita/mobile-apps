import 'package:customer/models/map_location.dart';
import 'package:customer/utils/search_controller.dart';
import 'package:flutter/material.dart';

import 'location_widget.dart';

class RecentSearchesWidget extends StatefulWidget {
  final Function(MapLocation mapLocatiom) onTap;

  const RecentSearchesWidget({Key key,@required this.onTap}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RecentSearchesWidgetState();
}

class _RecentSearchesWidgetState extends State<RecentSearchesWidget> {
  List<MapLocation> recents;

  @override
  void initState() {
    super.initState();
    SearchController.getRecentSearches().then((val){
      if(val!=null&&mounted){
        setState(() {
          this.recents=val;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      buildDivider("Recent Location"),
      recents != null
          ? ListView.builder(
              itemBuilder: (context, index) {
                return LocationWidget(
                  recent: true,
                  onTap: (location) {
                    widget.onTap(location);
                  },
                  location: recents[index],
                );
              },
              itemCount: recents.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            )
          : Center(child: CircularProgressIndicator())
    ]);
  }

  Widget buildDivider(String title) {
    return Container(

      child: ListTile(
          title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black,fontSize: 18.0),
      )),
    );
  }
}
