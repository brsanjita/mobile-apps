import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:store/widgets/time_picker_widget.dart';

class EarningsScreen extends StatefulWidget {
  @override
  _EarningsScreenState createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Earnings History"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: _buildPicker("From", (time) {})),
                Expanded(child: _buildPicker("To", (time) {})),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  buildCountWidget("Total Orders", 0),
                  buildCountWidget("Total Earnings", 0)
                ].map((child) => Expanded(child: child)).toList(),
              ),
            ),
            Expanded(
              child: Center(
                child: Text("No data Available",style: TextStyle(fontSize:18.0 ),),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPicker(String label, Function(DateTime time) onSelected) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              label,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CustomTimePickerWidget(
              minDate: DateTime.now(), onSelected: onSelected)
        ]);
  }

  Widget buildCountWidget(String label, int count) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              count == 0 ? "--" : "$count",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
