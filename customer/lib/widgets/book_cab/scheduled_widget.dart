import 'package:flutter/material.dart';

class ScheduledWidget extends StatelessWidget {
  final DateTime schedule;

  const ScheduledWidget({Key key, this.schedule}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(text,style: TextStyle(fontSize: 18.0),),
    );
  }
  String get text{
    String start="${getDay(schedule.weekday)}, ${getMonth(schedule.month)} ${schedule.day}";
    String end="$startTime - $endTime";
    return start+" "+end;
  }
  String getMonth(int month){
    return ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"][month];
  }
  String getDay(int day){
    return ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"][day];
  }
  String get startTime{
    int hour=schedule.hour;
    int minute=schedule.minute;
    return "$hour:$minute";
  }
  String get endTime{
    int hour=schedule.hour;
    int minute=schedule.minute+10;
    if(minute>=60){
      minute=(minute)%60;
      hour=(hour+1)%24;
    }
    return "$hour:$minute";
  }
}