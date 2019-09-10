import 'package:common/widgets/linear_loader.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:common/widgets/cab/driver_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PassengerPickupScreen extends StatefulWidget {
  final String from, to;

  const PassengerPickupScreen({Key key, this.from, this.to}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PassengerPickupScreenState();
}

class _PassengerPickupScreenState extends State<PassengerPickupScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Pick Up Passenger")
      ),
      body: Stack(
        children: <Widget>[
          DriverMap(
            from: widget.from,
            to: widget.to,
            onRoutesLoaded: () {
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            },
            onControllerCompleted: (controller) {},
          ),
          buildDropLocation()
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundedButton("Arrived",onPressed: (){
          showDialog(context:context,builder:(context)=>AlertDialog(
            content: Text("Are you sure you have arrived at pickup location?",),
            actions:[
              FlatButton(
                child:Text("No"),
                onPressed:(){
                  Navigator.of(context).pop();
                }
              ),
              FlatButton(
                  child:Text("Yes"),
                  onPressed:(){
                    Navigator.of(context).pop();
                  }
              ),
            ]
          ));
        },color: Colors.black,),
      ),
    );
  }

  Widget buildDropLocation() {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "${widget.to}",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              isLoading
                  ? LinearLoader(
                      height: 2.0,
                    )
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
