import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPickupMap extends StatefulWidget {
  final Function(LatLng) onPositionChanged;
  final Function(LocationPickController)controllerCompleted;
  const LocationPickupMap(
      {Key key, this.onPositionChanged, this.controllerCompleted,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocationPickupMapState();
}

class _LocationPickupMapState extends State<LocationPickupMap> {
  final Set<Marker> _markers = {};
  int currentIndex = 0;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;
  LatLng _position = LatLng(17.3850, 78.4867);
  Marker marker;
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
        onCameraIdle: (){
          if(searching)
          {
            widget.onPositionChanged(_markers.elementAt(0).position);
            searching=false;
          }
        },
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(target: _position, zoom: 8),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _mapController = controller;
          widget.controllerCompleted(LocationPickController._(this));
          addMarkerIcon();
        },
        markers: _markers,
        onCameraMove: _onCameraMove,
      ),
    );
  }
  bool searching=false;
  void _onCameraMove(CameraPosition position) {
    _position = position.target;
    setState(() {
      searching=true;
      _markers.clear();
      _markers.add(marker.copyWith(positionParam: _position));
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), );
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png,)).buffer.asUint8List();
  }

  void addMarkerIcon()async{
    String asset = 'assets/images/picker.png';
    final Uint8List markerIcon = await getBytesFromAsset(asset, 200);
    _markers.clear();
    marker=Marker(
        zIndex: 1.0,
        markerId: MarkerId("23"),
        position: _position,
        icon: BitmapDescriptor.fromBytes(markerIcon),
        draggable: false,
        infoWindow: InfoWindow(title:"Your location")
    );
    _markers.add(marker);
    setState(() {

    });
  }
}

class LocationPickController{
  final _LocationPickupMapState state;
  LocationPickController._(this.state);
  void moveTo(LatLng position){
    if(this.state._mapController!=null){
      this.state._mapController.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: position,zoom: 10.0)));
    }
    this.state._position=position;
    this.state.addMarkerIcon();
  }
}