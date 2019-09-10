import 'package:flutter/material.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:store/widgets/time_picker_widget.dart';
import 'package:store/widgets/time_widget.dart';

class SetTimingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetTimingsScreenState();
}

class _SetTimingsScreenState extends State<SetTimingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Timings"),
      ),
      body: ListView(
        children: <Widget>[
          buildSlotTile("Monday to Friday (Slot1)",
              TimeOfDay(hour: 0, minute: 1), TimeOfDay(hour: 14, minute: 0)),
          buildSlotTile("Monday to Friday (Slot2)",
              TimeOfDay(hour: 14, minute: 0), TimeOfDay(hour: 23, minute: 59)),
          buildSlotTile("Monday to Friday (Slot1)",
              TimeOfDay(hour: 0, minute: 1), TimeOfDay(hour: 14, minute: 0)),
          buildSlotTile("Monday to Friday (Slot1)",
              TimeOfDay(hour: 14, minute: 1), TimeOfDay(hour: 23, minute: 59)),
        ],
      ),
      bottomNavigationBar: RoundedButton(
        "Save",
        onPressed: () {},
        color: Colors.black,
      ),
    );
  }

  Widget buildSlotTile(String label, TimeOfDay start, TimeOfDay stop) {
    return Card(
      margin: EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TimeWidget(initialTime: start,),
                  TimeWidget(initialTime: stop,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
