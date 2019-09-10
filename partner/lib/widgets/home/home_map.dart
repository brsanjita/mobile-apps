import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeMap extends StatefulWidget {
  final Function(HomeMapController) onControllerCompleted;
  const HomeMap(
      {Key key,
        @required this.onControllerCompleted,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  final String markerID = "12453789";
  LatLng driverLocation = LatLng(17.3850, 78.4867);
  final Set<Marker> _markers = Set();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;
  Location location = Location();
  static const String RIGHT="right",LEFT="left",UP="up",DOWN="down";
  List<double>history=[0.0,0.0];
  List<String> direction = ["NONE","NONE"];

  @override
  void initState() {
    super.initState();
  }

  double bearingBetweenLocations(LatLng from,LatLng to) {
    double tLat=to.latitude;
    double tLng=to.longitude;
    double fLat=from.latitude;
    double fLng=from.longitude;
    double x=cos(tLat)*sin(tLng-fLng);
    double y=(cos(fLat)*sin(tLat))-(sin(fLat)*cos(tLat));
    double angle=atan2(x,y)*180/pi;
    return angle;
  }

  void locationListen(LatLng destination) async {
    try {
      await location.requestPermission();
      location.getLocation().then((data) {
        print("Location $data");
        _mapController.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(data.latitude, data.longitude), zoom: 12.0)));
        _moveCab(data);
        double angle=bearingBetweenLocations(LatLng(data.latitude,data.longitude), destination);
        _rotateCab(angle);
      });
      location.onLocationChanged().listen((data){
        _moveCab(data);
        polylines.clear();
        polylines.add(Polyline(polylineId: PolylineId("12"),points: [LatLng(data.latitude, data.longitude),destination]));
        setState(() {

        });
        double angle=bearingBetweenLocations(LatLng(data.latitude,data.longitude),destination);
        _rotateCab(angle);
      });
    } catch (e) {
      print("Error ${e.message}");
    }
  }

  Future<Marker> addMarkerIcon(String asset,LatLng position) async {
    final Uint8List markerIcon = await getBytesFromAsset(asset, 125);
    Marker marker = Marker(
      zIndex: 1.0,
      markerId: MarkerId(asset),
      position: position,
      icon: BitmapDescriptor.fromBytes(markerIcon),
      draggable: false,
      onTap: () {
        //Todo on taxi clicked
      },
      consumeTapEvents: true,
      flat: false,

    );
    _markers.add(marker);
    setState(() {});
    return marker;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetWidth: width
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
      format: ui.ImageByteFormat.png,
    ))
        .buffer
        .asUint8List();
  }
  Set<Polyline>polylines=Set<Polyline>();
  Marker cabMarker;
  @override
  Widget build(BuildContext context) {
    print("Markers ${_markers.length}");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        polylines: polylines,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(target: driverLocation, zoom: 8),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _mapController = controller;
        },
        markers: _markers,
        onCameraMove: _onCameraMove,
      ),
    );
  }

  void _onCameraMove(CameraPosition position) {

  }
  void _moveCab(LocationData data) {
    if (cabMarker==null) {
      return;
    }

    _markers.remove(cabMarker);
    cabMarker = cabMarker.copyWith(positionParam: LatLng(data.latitude, data.longitude));

    _markers.add(cabMarker);
    setState(() {

    });
  }
  void _rotateCab(double direction){
    if (cabMarker==null) {
      return;
    }
    _markers.remove(cabMarker);
    cabMarker = cabMarker.copyWith(rotationParam: direction);
    _markers.add(cabMarker);
    setState(() {

    });
  }
}

class HomeMapController {
  final _HomeMapState _taxiMapState;

  HomeMapController._(this._taxiMapState);

  Future drawRoutes(LatLng destination)async{
     _taxiMapState.locationListen(destination);
  }

}