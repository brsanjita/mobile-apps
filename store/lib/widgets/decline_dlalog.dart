import 'package:flutter/material.dart';
import 'package:store/models/order.dart';

class DeclineDialog extends StatefulWidget {
  final Order order;

  const DeclineDialog({Key key,@required this.order}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DeclineDialogState();
}

class _DeclineDialogState extends State<DeclineDialog> {
  String val='- Select Reason -';
  List<String> options = [
    '- Select Reason -',
    'Driver not found',
    'Item is out of stock',
    'Other'
  ];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Decline Order"),
      content: DropdownButtonFormField(
        value: val,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: Colors.purple)
          )
        ),
          items: options
              .map(
                (option) => DropdownMenuItem(
                      child: Text(
                        option,
                      ),
                      value: option,
                    ),
              )
              .toList(),onChanged: (val)=>setState(()=>this.val=val),),

      actions: <Widget>[
        FlatButton(onPressed: (){}, child: Text("Submit"))
      ],
    );

  }
}
