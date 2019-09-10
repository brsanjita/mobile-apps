import 'package:flutter/material.dart';

class DurationSelectionScreen extends StatefulWidget {
  final String selectedTimings;
  final Function(String) onSelected;

  const DurationSelectionScreen(
      {Key key, this.selectedTimings, this.onSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DurationSelectionScreenState();
}

class _DurationSelectionScreenState extends State<DurationSelectionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildTimingTile(
          "6am to 9am",
        ),
        _buildTimingTile("10am to 1pm", enabled: false),
        _buildTimingTile("2pm to 5pm", enabled: false),
        _buildTimingTile("6pm to 10pm"),
      ],
    );
  }

  Widget _buildTimingTile(String timings,
      {bool enabled = true, bool selected = false}) {
    return ListTile(
      onTap: () {
        if (enabled) widget.onSelected(timings);
      },
      leading: widget.selectedTimings == timings
          ? Icon(Icons.check_circle, color: Colors.deepOrange)
          : Container(
              width: 22.0,
              height: 22.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: enabled ? Colors.deepOrange : Colors.black54,
                      width: 1.5)),
            ),
      title: Text(
        timings,
        style: TextStyle(
            color: enabled ? Colors.black : Colors.black54,
            decoration:
                !enabled ? TextDecoration.lineThrough : TextDecoration.none),
      ),
    );
  }
}
