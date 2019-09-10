import 'package:common/widgets/linear_loader.dart';
import 'package:customer/widgets/location_search/driver_map.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CabArrivingScreen extends StatefulWidget {
  final String from, to;

  const CabArrivingScreen({Key key, this.from, this.to}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CabArrivingScreenState();
}

class _CabArrivingScreenState extends State<CabArrivingScreen> {
  bool isLoading = true;

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
                  isLoading = false;
                });
              }
            },
            onControllerCompleted: (controller) {},
          ),
          buildDropLocation(),
          Align(
            alignment: Alignment.bottomCenter,
            child: buildReviewDriverWidget(),
          )
        ],
      ),
    );
  }

  Widget buildDropLocation() {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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

  Widget buildReviewDriverWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: FloatingActionButton(
            child: Icon(Icons.my_location),
            onPressed: (){},
          ),
        ),
        Container(
          padding: EdgeInsets.all(12.0),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Color(0xffeeeeee),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Vikram",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SmoothStarRating(
                        rating: 4.2,
                        color: Colors.yellow,
                        starCount: 5,
                      ),
                      Text(
                        "Acura",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        "(Luxurious}",
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.local_taxi),
                    Container(
                        padding: EdgeInsets.all(4.0),
                        color: Colors.black,
                        child: Text(
                          "CK201",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ))
                  ],
                )
              ]),
              Divider(),
              Row(
                children: [Icons.call, Icons.message, Icons.cancel, Icons.share]
                    .map((val) => Expanded(
                        child: IconButton(
                            icon: Icon(
                              val,
                              color: Colors.green,
                            ),
                            onPressed: () {})))
                    .toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
