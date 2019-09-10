import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class CustomTimePickerWidget extends StatefulWidget {
  final DateTime minDate;
  final Function(DateTime) onSelected;

  CustomTimePickerWidget({Key key,@required this.minDate,@required this.onSelected}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CustomTimePickerWidgetState();
}

class _CustomTimePickerWidgetState extends State<CustomTimePickerWidget> {
  static const String defaultDate='1971-01-01';
  String date=defaultDate;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        DatePicker.showDatePicker(context,onConfirm: (DateTime time,val){
           setState(() {
             date=time.toString().split(" ")[0];
           });
           widget.onSelected(time);
        },minDateTime: widget.minDate,);
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))
        ),
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(date,style: TextStyle(fontSize: 18.0,color: date==defaultDate?Colors.black54:Colors.black),),
            ),
            Icon(Icons.calendar_today)
          ],
        ),
      ),
    );
  }
}
