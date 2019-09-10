import 'package:flutter/material.dart';


class CustomInputWidget extends StatelessWidget {
  final Function(String val) onSubmitted;
  final bool obscure;
  final String label;

  const CustomInputWidget({Key key,@required this.onSubmitted,@required this.label, this.obscure=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          labelText: label,
          hasFloatingPlaceholder: true,
          border: OutlineInputBorder()
        ),
        obscureText: obscure,
        style: TextStyle(
          fontSize: 18.0
        ),
      ),
    );
  }

}