import 'package:common/widgets/rounded_button.dart';
import 'package:customer/models/map_location.dart';
import 'package:customer/screens/cab/location_picker_map.dart';
import 'package:customer/widgets/book_cab/pinnned_modal_sheet.dart';
import 'package:customer/widgets/location_search/location_input_widget..dart';
import 'package:customer/widgets/location_search/location_search_widget.dart';
import 'package:customer/widgets/location_search/nearby_widget.dart';
import 'package:customer/widgets/location_search/recent_searches_widget.dart';
import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen>
    with TickerProviderStateMixin<LocationPickerScreen> {
  AnimationController controller;
  bool mapPicking = false;

  int current = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      value: 1.0,
      duration: Duration(seconds: 1),
    );
    address = TextEditingController();
    address.addListener(() {
      if (mounted) setState(() {});
    });
    addressFocusNode.addListener(() {
      if (mounted) {
        setState(() {
          mapPicking = false;
        });
      }
    });
  }

  TextEditingController address;
  FocusNode addressFocusNode = FocusNode();

  bool get searching {
    return address.text != '';
  }

  String get query {
    return address.text;
  }

  @override
  Widget build(BuildContext context) {
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
                popBack();
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
                  LocationInputWidget(
                    hint: "Enter location",
                    controller: address,
                    focusNode: addressFocusNode,
                  ),
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
                            popBack();
                          },
                          color: Colors.black,
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
                                        popBack();
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

  void chooseLocation(MapLocation location) {
    print("Choose Location ${location.main_text}");
    address.text = location.main_text;
  }

  void popBack() {
    Navigator.of(context).pop(address.text);
  }
}
