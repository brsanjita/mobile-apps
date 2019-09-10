import 'package:flutter/material.dart';

class SelectionBottomSheet extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(String) onSelected;
  final String initialValue;

  const SelectionBottomSheet({
    Key key,
    @required this.title,
    @required this.options,
    this.onSelected,
    this.initialValue,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectionBottomSheetState();
}

class _SelectionBottomSheetState extends State<SelectionBottomSheet> {
  @override
  void initState() {
    currentVal = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[_buildHeader(), _buildRadioTiles()],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          FlatButton(
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  String currentVal = "";

  Widget _buildRadioTiles() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.options
          .map((val) => RadioListTile(
              value: val,
              title: Text(val),
              groupValue: currentVal,
              onChanged: (check) {
                setState(() {
                  this.currentVal = val;
                });
                widget.onSelected(val);
              }))
          .toList(),
    );
  }
}
