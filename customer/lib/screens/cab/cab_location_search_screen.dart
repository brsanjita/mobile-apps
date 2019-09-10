import 'package:common/widgets/rounded_button.dart';
import 'package:customer/models/map_location.dart';
import 'package:customer/screens/cab/book_cab_screen.dart';
import 'package:customer/screens/cab/location_picker_map.dart';
import 'package:customer/widgets/book_cab/pinnned_modal_sheet.dart';
import 'package:customer/widgets/book_cab/scheduled_widget.dart';
import 'package:customer/widgets/location_search/location_input_widget..dart';
import 'package:customer/widgets/location_search/location_search_widget.dart';
import 'package:customer/widgets/location_search/nearby_widget.dart';
import 'package:customer/widgets/location_search/recent_searches_widget.dart';
import 'package:flutter/material.dart';

class CabLocationSearchScreen extends StatefulWidget {
  final DateTime scheduledTime;
  final Function(String, String, DateTime) onSelected;

  const CabLocationSearchScreen({Key key, this.scheduledTime, this.onSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CabLocationSearchScreenState();
}

class _CabLocationSearchScreenState extends State<CabLocationSearchScreen>
    with TickerProviderStateMixin<CabLocationSearchScreen> {
  TextEditingController from, to;
  AnimationController controller;
  int current = 0;
  FocusNode fromFocusNode = FocusNode(), toFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      value: 1.0,
      duration: Duration(seconds: 1),
    );

    from = TextEditingController();
    to = TextEditingController();
    from.addListener(() {
      if (mounted) setState(() {});
    });
    to.addListener(() {
      if (mounted) setState(() {});
    });
    fromFocusNode.addListener(() {
      if (fromFocusNode.hasFocus) {
        lastFocus = 0;
        if (mounted) {
          setState(() {
            mapPicking = false;
          });
        }
      }
    });
    toFocusNode.addListener(() {
      if (toFocusNode.hasFocus) {
        lastFocus = 1;
        if (mounted) {
          setState(() {
            mapPicking = false;
          });
        }
      }
    });
  }

  int lastFocus = -1;
  bool mapPicking = false;

  @override
  Widget build(BuildContext context) {
    print("Searching $searching");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    color: Color(0xffeeeeee), shape: BoxShape.circle),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(32.0),
                    child: Image.network(
                      "https://avatars0.githubusercontent.com/u/31070108?s=460&v=4",
                      width: 28.0,
                      height: 28.0,
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Me",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),
                ),
              ),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                goToBooking();
              },
              child: Text(
                "Done",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          Material(
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  widget.scheduledTime != null
                      ? ScheduledWidget(
                          schedule: widget.scheduledTime,
                        )
                      : Container(
                          width: 0.00,
                          height: 0.0,
                        ),
                  LocationInputWidget(
                    hint: "Enter pickup location",
                    controller: from,
                    focusNode: fromFocusNode,
                  ),
                  LocationInputWidget(
                    hint: "Where to ?",
                    controller: to,
                    focusNode: toFocusNode,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                LocationPickerMap(
                  onAddressChanged: (address) {
                    if (lastFocus == -1) lastFocus = 1;
                    chooseLocation(MapLocation(address, address, address));
                  },
                  onMoved: (check) {
                    setState(() {
                      mapPicking = check;
                    });
                  },
                ),
                mapPicking
                    ? Padding(
                        padding: EdgeInsets.all(16.0),
                        child: RoundedButton(
                          "Done",
                          onPressed: () {
                            goToBooking();
                          },
                          color: Theme.of(context).buttonColor,
                        ),
                      )
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          print("Height ${constraints.maxHeight}");
                          return Material(
                            elevation: 2.5,
                            child: PinnedModalSheet(
                              onExpanded: () {},
                              initialExpanded: true,
                              headerHeight: 150.0,
                              child: searching
                                  ? LocationSearch(
                                      query: query,
                                      onLocationSelected: (location) {
                                        chooseLocation(location);
                                      },
                                    )
                                  : Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        NearbyWidget(),
                                        RecentSearchesWidget(onTap: (location) {
                                          chooseLocation(location);
                                        }),
                                      ],
                                    ),
                              height: constraints.maxHeight,
                            ),
                          );
                        },
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void goToBooking() {
    if (to.text == '' || from.text == '') {
      showAlertDialog("You have not entered your locarion");
      return;
    }
    widget.onSelected(from.text, to.text, widget.scheduledTime);
  }

  bool get searching {
    if (lastFocus == 0) {
      lastFocus = 0;
      return from.text != '';
    }
    if (lastFocus == 1) {
      lastFocus = 1;
      return to.text != '';
    }
    return false;
  }

  String get query {
    if (lastFocus == 0) {
      return from.text;
    }
    if (lastFocus == 1) {
      return to.text;
    }
    return '';
  }

  void chooseLocation(MapLocation location) {
    print("Choose Location ${location.main_text}");
    if (lastFocus == 0) {
      from.text = location.main_text;
      fromFocusNode.unfocus();
      if (to.text == '') toFocusNode.requestFocus();
      setState(() {
        mapPicking = false;
      });
    }
    if (lastFocus == 1) {
      to.text = location.main_text;
      toFocusNode.unfocus();
      setState(() {
        lastFocus = -1;
      });
    }
  }

  void showAlertDialog(String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text(
                "Do you want to continue?",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel")),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"))
              ],
            ));
  }

  void popSearch(String address) {
    Navigator.of(context).pop({'location': address});
  }
}
