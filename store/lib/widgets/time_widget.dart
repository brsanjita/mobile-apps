import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  final TimeOfDay initialTime;

  const TimeWidget({Key key,@required this.initialTime}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  TimeOfDay time = TimeOfDay(hour: 0, minute: 1);
  @override
  void initState() {
    super.initState();
    time=widget.initialTime;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showTimePicker(
                context: context, initialTime: widget.initialTime)
            .then((val) {
              if(val!=null)
          setState(() {
            this.time = val;
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${time.hour}:${time.minute}",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.calendar_today),
            )
          ],
        ),
      ),
    );
  }
}
