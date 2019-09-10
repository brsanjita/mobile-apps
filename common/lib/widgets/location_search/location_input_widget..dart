import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationInputWidget extends StatefulWidget {
  final String initialText;
  final String hint;
  final Function(String val) onChanged;
  final Function(String val) onSubmitted;
  final FocusNode focusNode;
  final TextEditingController controller;
  const LocationInputWidget({
    Key key,
    this.initialText = '',
    @required this.hint,
    this.onChanged,
    this.onSubmitted, this.focusNode, this.controller,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  FocusNode focusNode;
  TextEditingController editor;
  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode??FocusNode();
    editor = widget.controller??TextEditingController(text: widget.initialText);
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Color(0xffeeeeee),
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: editor,
                focusNode: focusNode,
                maxLines: 1,
                autofocus: true,
                minLines: 1,
//                onSubmitted: widget.onSubmitted,
//                onChanged: widget.onChanged,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hint,
                    icon: Icon(Icons.location_on, size: 20.0)),
              ),
            ),
            focusNode.hasFocus
                ? InkWell(
                    child: Icon(
                      Icons.cancel,
                      color: Colors.black54,
                      size: 20.0,
                    ),
                    onTap: () {
                      editor.text = "";
                    },
                  )
                : Container(
                    width: 0.0,
                    height: 0.0,
                  )
          ],
        ));
  }
}
