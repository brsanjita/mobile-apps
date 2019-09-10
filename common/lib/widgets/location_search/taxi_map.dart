import 'dart:async';

import 'package:common/models/taxi.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TaxiMap extends StatefulWidget {
  final List<Taxi> taxis;
  final Function onTaxiChanged;
  final Function onControllerCompleted;

  const TaxiMap(
      {Key key,
      @required this.taxis,
      this.onTaxiChanged,
      this.onControllerCompleted})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaxiMapState();
}

class _TaxiMapState extends State<TaxiMap> {
  final Set<Marker> _markers = {};
  int currentIndex = 0;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;
  LatLng _position = LatLng(17.3850, 78.4867);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Markers ${_markers.length}");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(target: _position, zoom: 8),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _mapController = controller;
          widget.onControllerCompleted(TaxiMapController._(this));
        },
        markers: _markers,
        onCameraMove: _onCameraMove,
      ),
    );
  }

  void _onCameraMove(CameraPosition position) {
    _position = position.target;
  }

  void _addMarkers() async {
    print("Taxis ${widget.taxis.length}");
    for (int i = 0; i < widget.taxis.length; i++) {
      Taxi value = widget.taxis[i];
      String asset = 'assets/images/taxi.png';
      bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
      BitmapDescriptor descriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(32.0, 32.0)),
        asset,
      );
      _markers.add(Marker(
        zIndex: currentIndex == i ? 10.0 : 1.0,
        markerId: MarkerId("${value.plateNo}"),
        position: value.location,
        icon: descriptor,
        onTap: () {
          //Todo
        },
      ));
    }
    print(_markers.length);
    setState(() {});
  }

  void _removeMarkers() {
    _markers.clear();
  }
}

class TaxiMapController {
  final _TaxiMapState _taxiMapState;

  TaxiMapController._(this._taxiMapState);

  void addMarkers() {
    _taxiMapState._removeMarkers();
    _taxiMapState._addMarkers();
  }

  void moveToMarker(int index) {
    _taxiMapState.currentIndex = index;
    Marker marker = _taxiMapState._markers.elementAt(index);
    _taxiMapState._mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: marker.position, zoom: 11.0)));
    addMarkers();
  }

  void moveToLocation(LatLng position) {
    _taxiMapState._position = position;
    _taxiMapState._mapController.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 10.0)));
  }
}
