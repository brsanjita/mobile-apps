import 'package:common/models/location_search/map_location.dart';
import 'package:common/screens/location/location_input_screen.dart';
import 'package:common/utils/location_controller.dart';
import 'package:flutter/material.dart';

class LocationTextWidget extends StatefulWidget{
  final String text;
  final String hint;
  final Function(MapLocation)onLocationSelected;
  const LocationTextWidget({Key key, this.text, this.hint, this.onLocationSelected}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>_LocationTextWidgetState();

}

class _LocationTextWidgetState extends State<LocationTextWidget> {

  MapLocation location;
  String text="";

  @override
  void initState() {
    super.initState();
    this.text=widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        var data=await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocationInputScreen()));
        if(data!=null){
          MapLocation location=data[LocationController.LOCATION_KEY];
          setState(() {
            this.text=location.main_text;
          });
          widget.onLocationSelected(location);
        }
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Color(0xffeeeeee),
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.location_on,
                  size: 20.0,
                ),
              ),
              Expanded(
                child: Text(
                  isClickable? text : widget.hint,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: isClickable ? Colors.black : Colors.black54),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: isClickable ? Colors.black54 : Colors.transparent,
                    size: 20.0,
                  ),
                  onPressed: isClickable ? () {
                    setState(() {
                      this.text='';
                      location=null;
                    });
                  } : null)
            ],
          )),
    );
  }

  bool get isClickable => text.length != 0;
}
