import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:partner/models/cab/cab.dart';
import 'package:partner/widgets/app_drawer.dart';
import 'package:partner/widgets/home/home_map.dart';
import 'package:common/widgets/map/custom_map.dart';
import 'package:common/screens/location/location_picker_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isActive = false;
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Partner"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, "/notifications");
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: CustomMap(
        onControllerCompleted: (CustomMapController val) {},
        onTap: (CustomMapData val) {},
      ),
      bottomNavigationBar: _buildActiveChanger(),
    );
  }

  Widget _buildActiveChanger() {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          !isActive?Container(width: 0.0,height: 0.0,):buildOptions(),
          SizedBox(height: 8.0,),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Color(0xffD3D3D3),
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 36.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "CK201 Aprilla Atlantic 500".toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      InkWell(
                        child: Text(
                          "Change",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Go ${isActive ? "Offline" : "Online"}",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  Switch(
                      value: isActive,
                      onChanged: (val) {
                        setState(() {
                          this.isActive = val;
                        });
                      })
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOptions(){
    return Row(
      children: <Widget>[
        Expanded(
            child:_buildOption(title: "Taxi Hail",onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocationPickerScreen()));
            })
        ),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
            child:_buildOption(title: "Drive Home",onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocationPickerScreen()));
            })
        )
      ],
    );
  }

  Widget _buildOption({String title,Function() onPressed}){
    return RaisedButton(
      elevation: 0.0,
      padding: EdgeInsets.all(12.0),
      color: Colors.white,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
