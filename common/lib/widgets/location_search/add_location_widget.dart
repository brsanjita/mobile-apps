import 'package:flutter/material.dart';

class AddLocationWidget extends StatefulWidget {
  final String label;
  final IconData icon;

  const AddLocationWidget({Key key,@required this.label,@required this.icon}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AddLocationWidgetState();

}

class _AddLocationWidgetState extends State<AddLocationWidget> {
  String address;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: address!=null?Text(address):Text("Add ${widget.label}"),
      subtitle: address!=null?Text("${widget.label} Place"):null,
      onTap: (){},
      leading: IconButton(icon: Icon(widget.icon),onPressed: (){},),
      trailing: IconButton(icon: Icon(address==null?Icons.add:Icons.edit), onPressed: (){}),
    );
  }

}