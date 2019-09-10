import 'package:flutter/material.dart';

class DropInputWidget extends StatefulWidget {
  final List<String> values;
  final String initialValue;
  final String label;
  final Function(String) onChanged;

  const DropInputWidget(
      {Key key,
      @required this.values,
      @required this.initialValue,
      @required this.label,
      @required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropInputWidgetState();
}

class _DropInputWidgetState extends State<DropInputWidget> {
  String initialValue;

  @override
  void initState() {
    super.initState();
    this.initialValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.label,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
            DropdownButtonFormField(
              items: widget.values
                  .map((val) => DropdownMenuItem(
                        child: Text(val),
                        value: val,
                      ))
                  .toList(),
              value: initialValue,
              onChanged: (val) {
                setState(() {
                  widget.onChanged(val);
                });
              },
            )
          ]),
    );
  }
}
