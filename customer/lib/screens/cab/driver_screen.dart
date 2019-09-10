import 'package:customer/widgets/location_search/driver_map.dart';
import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  final String from,to;

  const DriverScreen({Key key, this.from, this.to}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  static const String RIGHT="right",LEFT="left",UP="up",DOWN="down";
  List<double>history=[0.0,0.0];
  List<String> direction = ["NONE","NONE"];
  DriverMapController controller;
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft, children: <Widget>[
          DriverMap(
            from: widget.from,
            to:widget.to,
            onControllerCompleted: (controller){
              this.controller=controller;
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 4.0),
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                onPressed: () {},
                child: Icon(Icons.arrow_back,color: Colors.white,),
                color: Colors.black,
                shape: CircleBorder(),
                elevation: 0.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
