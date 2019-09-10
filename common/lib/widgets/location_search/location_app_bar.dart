import 'package:common/screens/location/location_picker_screen.dart';
import 'package:common/utils/location_controller.dart';
import 'package:flutter/material.dart';

class LocationAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) onAddressChanged;

  const LocationAppBar({Key key, this.onAddressChanged}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocationAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(75.0);
}

class _LocationAppBarState extends State<LocationAppBar> {
  String address = "Searching location..";

  @override
  void initState() {
    super.initState();
    LocationController.getCurrentAdress().then((val) {
      if (mounted) {
        setState(() {
          address = val;
        });
      }
      chooseAddress(address);
    });
  }

  void chooseAddress(String address) {
    if (widget.onAddressChanged != null) widget.onAddressChanged(address);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 2.0,
        color: Colors.black,
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  }),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    String temp = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => LocationPickerScreen()));
                    if (temp != null && mounted) {
                      setState(() {
                        this.address = temp;
                      });
                      chooseAddress(address);
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Location for availing Service",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                "$address",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
//                trailing: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
