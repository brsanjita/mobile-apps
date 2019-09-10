import 'package:common/widgets/rounded_button.dart';
import 'package:customer/screens/cab/book_cab_screen.dart';
import 'package:customer/screens/cab/cab_location_search_screen.dart';
import 'package:flutter/material.dart';

class CabScheduler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CabSchedulerState();
}

class _CabSchedulerState extends State<CabScheduler> {
  DateTime scheduleTime;

  @override
  void initState() {
    super.initState();
    scheduleTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Schedule a trip",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
            ),
          ),
          Divider(),
          ListTile(
            onTap: () async {
              DateTime current = DateTime.now();
              DateTime result = await showDatePicker(
                  context: context,
                  initialDate: scheduleTime,
                  firstDate: current.subtract(Duration(days: 1)),
                  lastDate: DateTime.now().add(Duration(days: 7)));
              if (mounted && result != null) {
                setState(() {
                  scheduleTime = result.add(Duration(
                      hours: scheduleTime.hour, minutes: scheduleTime.minute));
                });
              }
            },
            title: Center(
                child: Text(
                    "${getDay(scheduleTime.weekday)}, ${getMonth(scheduleTime.month)} ${scheduleTime.day}",
                    style: TextStyle(
                      fontSize: 20.0,
                    ))),
          ),
          Divider(),
          ListTile(
            onTap: () async {
              TimeOfDay time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(
                    hour: scheduleTime.hour, minute: scheduleTime.minute),
              );
              if (mounted)
                setState(() {
                  if (time != null) {
                    scheduleTime = DateTime(
                        scheduleTime.year,
                        scheduleTime.month,
                        scheduleTime.day,
                        time.hour,
                        time.minute);
                  }
                });
            },
            title: Center(
                child: Text("$startTime - $endTime",
                    style: TextStyle(
                      fontSize: 20.0,
                    ))),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedButton(
              "Set Pick-Up Window",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CabLocationSearchScreen(
                          scheduledTime: scheduleTime,
                          onSelected: (from, to, time) {
                            if(mounted)
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BookCabScreen(
                                            from: from,
                                            to: to,
                                            scheduledTime: time,
                                          )));
                          },
                        )));
              },
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  String getMonth(int month) {
    return [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ][month];
  }

  String getDay(int day) {
    return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][day];
  }

  String get startTime {
    int hour = scheduleTime.hour;
    int minute = scheduleTime.minute;
    return "$hour:$minute";
  }

  String get endTime {
    int hour = scheduleTime.hour;
    int minute = scheduleTime.minute + 10;
    if (minute >= 60) {
      minute = (minute) % 60;
      hour = (hour + 1) % 24;
    }
    return "$hour:$minute";
  }
}
