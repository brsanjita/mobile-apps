import 'package:common/models/taxi.dart';
import 'package:common/utils/location_controller.dart';
import 'package:customer/models/map_location.dart';
import 'package:customer/screens/cab/book_cab_screen.dart';
import 'package:customer/screens/cab/cab_location_search_screen.dart';
import 'package:customer/utils/taxi_controller.dart';
import 'package:customer/utils/user_controller.dart';
import 'package:customer/widgets/book_cab/cab_scheduler.dart';
import 'package:customer/widgets/custom_map.dart';
import 'package:customer/widgets/linear_loader.dart';
import 'package:customer/widgets/location_search/location_widget.dart';
import 'package:customer/widgets/location_search/taxi_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TaxiHomeScreen extends StatefulWidget {
  @override
  _TaxiHomeScreenState createState() => _TaxiHomeScreenState();
}

class _TaxiHomeScreenState extends State<TaxiHomeScreen> {
  LatLng position = LatLng(17.3850, 78.4867);
  List<Taxi> taxis = [];

  @override
  void initState() {
    super.initState();
  }

  CustomMapController controller;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomMap(
            onControllerCompleted: (controller) {
              this.controller = controller;
            },
            onCurrentLocationReceived: () {
              if (mounted)
                setState(() {
                  this.isLoading = false;
                });
            },
            onTap: (val) {},
          ),
          Positioned(
            top: 12.0,
            left: 12.0,
            child: SafeArea(
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                color: Colors.black,
                shape: CircleBorder(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {},
        child: Icon(Icons.my_location),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          isLoading
              ? LinearLoader()
              : Container(
                  width: 0.0,
                  height: 0.0,
                ),
          Container(
            color: Color(0xffeeeeee),
            margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CabLocationSearchScreen(
                            scheduledTime: null,
                            onSelected: (from, to, time) {
                              if(mounted)
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BookCabScreen(
                                              from: from,
                                              to: to,
                                              scheduledTime: time,
                                            )));
                            },
                          )));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        "Where to?",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 16.0,
                  color: Colors.grey,
                  width: 2.0,
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context, builder: (context) => CabScheduler());
                  },
                  icon: Icon(Icons.schedule),
                )
              ],
            ),
          ),
          LocationWidget(
            location: MapLocation("Chandi Chowk Rd, Maliwara,Chatt Pratap",
                "Gurudwara Sis Ganj Sahib Ji", ""),
          ),
          LocationWidget(
            location: MapLocation(
                "Veer Savarkar Block, Laxmi Nagar Commercial", "V3S Mall", ""),
          )
        ],
      ),
    );
  }
}
