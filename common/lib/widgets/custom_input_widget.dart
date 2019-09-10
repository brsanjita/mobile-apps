import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final Function(String val) onSubmitted;
  final bool obscure;
  final String label;
  final Icon icon;
  final Function(String) validator;
  const CustomInputWidget({Key key,@required this.onSubmitted,@required this.label, this.obscure=false, this.icon, this.validator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidate: true,
        validator: (val){
          print("Changed $val");
          onSubmitted(val);
          if(validator!=null){
            return validator(val);
          }
          return null;
        },
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          labelText: label,
          icon: icon,
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