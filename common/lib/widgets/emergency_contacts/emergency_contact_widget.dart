import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class EmergencyContactWidget extends StatelessWidget {

  final Contact contact;
  final Function() onTap;
  const EmergencyContactWidget({Key key,@required this.contact,@required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("${contact.displayName}",style: TextStyle(fontSize: 14.0,color: Colors.lightGreen),),
        subtitle: Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text("${contact.phones.length>0?contact.phones.toList()[0].value:""}"),
        ),
        trailing: IconButton(icon: Icon(Icons.close,size: 32.0,color: Colors.red,), onPressed:onTap),
      ),
    );
  }

}