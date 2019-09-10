import 'dart:async';
import 'package:common/utils/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatefulWidget {
  final Function(CustomMapData data) onTap;
  final Function(CustomMapController) onControllerCompleted;
  final Function onCurrentLocationReceived;
  final bool showLocationButton;
  const CustomMap(
      {Key key, @required this.onControllerCompleted, @required this.onTap, this.onCurrentLocationReceived,this.showLocationButton=false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  final List<CustomMapData> _data = [];
  final Set<Marker> _markers = {};
  int currentIndex = 0;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;
  LatLng _position = LatLng(17.3850, 78.4867);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(target: _position, zoom: 8),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _mapController = controller;
          widget.onControllerCompleted(CustomMapController._(this));
          _showCurrentPosition();
        },
        markers: _markers,
        onCameraMove: _onCameraMove,
      ),
//      floatingActionButton:FloatingActionButton(
//        child: Icon(Icons.my_location,color:Colors.black),
//        onPressed: (){
//          _showCurrentPosition();
//        },
//        backgroundColor: Colors.white,
//      )
    );
  }

  void _showCurrentPosition() async {
    LatLng position = await LocationController.getLocation();
    if (_mapController != null) moveToPosition(position);
    if(widget.onCurrentLocationReceived!=null)
    widget.onCurrentLocationReceived();
  }

  void moveToPosition(LatLng position) {
    _mapController.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 8.0)));
  }

  void _onCameraMove(CameraPosition position) {
    _position = position.target;
  }

  _showMarkers() async {
    _markers.clear();
    for (int i = 0; i < _data.length; i++) {
      CustomMapData value = _data[i];
      String asset = value.asset;

      BitmapDescriptor descriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(20.0, 20.0)),
        asset,
      );
      _markers.add(Marker(
        zIndex: currentIndex == i ? 10.0 : 1.0,
        markerId: MarkerId("${value.id}"),
        position: LatLng(value.position.latitude, value.position.longitude),
        infoWindow: InfoWindow(
          title: value.title,
        ),
        icon: descriptor,
        onTap: () =>widget.onTap(value),
      ));
    }
  }

  void _clearData() {
    if (mounted) {
      setState(() {
        this._data.clear();
      });
    }
  }

  void _addData(List<CustomMapData> data) {
    _clearData();
    if (mounted) {
      setState(() {
        this._data.addAll(data);
      });
    }
    _showMarkers();
  }
}

class CustomMapController {
  final _CustomMapState _customMapState;

  CustomMapController._(this._customMapState);

  void addData(List<CustomMapData> services) {
    _customMapState._addData(services);
  }

  void moveToMarker(int index) {
    _customMapState.currentIndex = index;
    Marker marker = _customMapState._markers.elementAt(index);
    _customMapState._mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: marker.position, zoom: 11.0)));
  }

  void moveToLocation(LatLng position) {
    _customMapState._position = position;
    _customMapState._mapController.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 10.0)));
  }
}

class CustomMapData {
  final String title;
  final String id;
  final LatLng position;
  final String asset;

  CustomMapData(this.id, this.title, this.position, this.asset);
}
