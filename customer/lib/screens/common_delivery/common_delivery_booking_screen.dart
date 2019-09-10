import 'package:common/models/taxi.dart';
import 'package:common/widgets/linear_loader.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:customer/models/offer/offer.dart';
import 'package:customer/screens/cab/cab_waiting_screen.dart';
import 'package:customer/screens/common_delivery/common_delivery_details_screen.dart';
import 'package:customer/utils/taxi_controller.dart';
import 'package:customer/widgets/book_cab/cab_request_widget.dart';
import 'package:customer/widgets/location_search/driver_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CommonDeliveryBookingScreen extends StatefulWidget {
  final String from, to;
  final DateTime scheduledTime;

  const CommonDeliveryBookingScreen(
      {Key key, @required this.from, @required this.to, this.scheduledTime})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommonDeliveryBookingScreenState();
}

class _CommonDeliveryBookingScreenState
    extends State<CommonDeliveryBookingScreen> {
  bool isRoutesLoading = true;
  List<Taxi> availableTaxis;

  Future getTaxis() async {
    availableTaxis = await TaxiController.getDeliveryTrucks(LatLng(0.0, 0.0));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DriverMap(
            from: widget.from,
            to: widget.to,
            onRoutesLoaded: () {
              if (mounted) {
                setState(() {
                  isRoutesLoading = false;
                });
              }
              getTaxis();
            },
            onControllerCompleted: (controller) {},
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                onPressed: () {},
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                color: Colors.black,
                shape: CircleBorder(),
                elevation: 0.0,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildTaxiMenu(),
    );
  }

  bool useCash = false;

  Widget buildTaxiScheduler() {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: RoundedButton(
        "Schedule cab",
        onPressed: () {},
        color: Colors.black,
      ),
    );
  }

  Offer offer;
  String selectedTaxi = "Basic";

  Widget buildTaxiMenu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        availableTaxis == null
            ? LinearLoader()
            : CabRequestWidget(
                taxis: availableTaxis,
                onSelected: () async{
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CommonDeliveryDetailsScreen()));
                  showDialog(context: context,builder: (context)=>AlertDialog(
                    title: Text("Night Charges will be applied as below",textAlign: TextAlign.center,),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("1.3X",style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.w600),),
                        SizedBox(height: 8.0,),
                        Text("Approx Payable Amount \$422",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w300),),
                        SizedBox(height: 8.0,),
                        RoundedButton("Accept Higher Price",onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CabWaitingScreen(from: widget.from,to:widget.to,)));
                        },color: Colors.black,),
                        FlatButton(onPressed: (){}, child: Text("Try Again"))
                      ],
                    ),
                  ));
                },
              )
      ],
    );
  }

  Widget buildTaxi(String name, double price) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedTaxi = name;
        });
      },
      child: Opacity(
        opacity: selectedTaxi == name ? 1.0 : 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 5),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.all(8.0),
              child: Icon(
                Icons.local_taxi,
                color: Colors.white,
                size: 22.0,
              ),
              padding: EdgeInsets.all(12.0),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 14.0),
            ),
            Text(
              "\$ $price",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
