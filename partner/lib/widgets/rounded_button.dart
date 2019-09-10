import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Widget leading;
  const RoundedButton(this.text,
      {Key key,
        @required this.onPressed,
        this.color = Colors.white,
        this.leading})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: widget.color,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.2),
                    blurRadius: 12.0,
                    spreadRadius: 0.1,
                    offset: Offset(0.5, 0.8))
              ]),
          margin: EdgeInsets.all(0.0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onPressed,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: widget.color == Colors.white
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
