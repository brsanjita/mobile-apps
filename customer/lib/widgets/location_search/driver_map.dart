import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:customer/models/cab/route_location.dart';
import 'package:customer/utils/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DriverMap extends StatefulWidget {
  final Function onControllerCompleted;
  final String from, to;
  final Function() onRoutesLoaded;
  const DriverMap({
    Key key,
    @required this.onControllerCompleted,
    this.from,
    this.to, this.onRoutesLoaded,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {
  final String markerID = "12453789";
  LatLng driverLocation = LatLng(17.3850, 78.4867);
  final Set<Marker> _markers = Set();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;
  Location location = Location();
  static const String RIGHT = "right", LEFT = "left", UP = "up", DOWN = "down";
  List<double> history = [0.0, 0.0];
  List<String> direction = ["NONE", "NONE"];
  List<RouteLocation> points = [];

  @override
  void initState() {
    super.initState();
    calculateRotationAngle();
    createRoute();
  }

  void calculateRotationAngle() {}

  double bearingBetweenLocations(LatLng from, LatLng to) {
    double tLat = to.latitude;
    double tLng = to.longitude;
    double fLat = from.latitude;
    double fLng = from.longitude;
    double x = cos(tLat) * sin(tLng - fLng);
    double y = (cos(fLat) * sin(tLat)) - (sin(fLat) * cos(tLat));
    double angle = atan2(x, y) * 180 / pi;
    return angle;
  }

  void addPolyLines() async {
    polylines.clear();
    for (int i = 0; i < points.length - 1; i++) {
      RouteLocation start = points[i];
      RouteLocation end = points[i + 1];
      polylines.add(Polyline(
          polylineId: PolylineId("$i"),
          width: 4,
          color: Colors.blue,
          consumeTapEvents: true,
          points: [LatLng(start.lat, start.lng), LatLng(end.lat, end.lng)]));
    }
    await addMarkerIcon(
        "assets/images/taxi.png", LatLng(points.first.lat, points.first.lng));
    print("Destination ${points.last.lat},${points.last.lng}");
    await addMarkerIcon("assets/images/destination.png",
        LatLng(points.last.lat, points.last.lng));
    if (mounted) setState(() {});
  }

  void createRoute() async {
    List<RouteLocation> points =
        await LocationController.getRoutes(widget.from, widget.to);
    this.points = points;
    locationListen();
    widget.onRoutesLoaded();
  }

  void locationListen() async {
    try {
      await location.requestPermission();
      location.getLocation().then((val) {
        updateData(val);
        _mapController.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: points.first.location, zoom: 10.0)));
      });
      location.onLocationChanged().listen((data) {
        updateData(data);
      });
    } catch (e) {
      print("Error ${e.message}");
    }
  }

  void updateData(LocationData data) {
    _moveCab(data);
    addPolyLines();
    double angle = bearingBetweenLocations(
        LatLng(data.latitude, data.longitude), points.last.location);
//        _rotateCab(angle);
    if (mounted) setState(() {});
  }

  Future<Marker> addMarkerIcon(String asset, LatLng position) async {
    final Uint8List markerIcon = await getBytesFromAsset(asset, 125);
    Marker marker = Marker(
      zIndex: 1.0,
      markerId: MarkerId(asset),
      position: position,
      icon: BitmapDescriptor.fromBytes(markerIcon),
      draggable: false,
      onTap: () {
        //Todo
      },
      consumeTapEvents: true,
      flat: false,
    );
    _markers.add(marker);
    if (mounted) setState(() {});
    return marker;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
      format: ui.ImageByteFormat.png,
    ))
        .buffer
        .asUint8List();
  }

  Set<Polyline> polylines = Set<Polyline>();
  Marker cabMarker;

  @override
  Widget build(BuildContext context) {
    print("Polylines ${polylines.length}");
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
          if (_mapController != null) {
            return;
          }
          _controller.complete(controller);
          _mapController = controller;

          widget.onControllerCompleted(DriverMapController._(this));
          createRoute();
        },
        markers: _markers,
        onCameraMove: _onCameraMove,
      ),
    );
  }

  void _onCameraMove(CameraPosition position) {}

  void _moveCab(LocationData data) {
    if (cabMarker == null) {
      return;
    }

    _markers.remove(cabMarker);
    cabMarker = cabMarker.copyWith(
        positionParam: LatLng(data.latitude, data.longitude));

    _markers.add(cabMarker);
    setState(() {});
  }

  void _rotateCab(double direction) {
    if (cabMarker == null) {
      return;
    }
    _markers.remove(cabMarker);
    cabMarker = cabMarker.copyWith(rotationParam: direction);
    _markers.add(cabMarker);
    setState(() {});
  }
}

class DriverMapController {
  final _DriverMapState _taxiMapState;

  DriverMapController._(this._taxiMapState);

  void rotateCab(double degree) {
//    _taxiMapState._rotateCab(degree);
  }
}
