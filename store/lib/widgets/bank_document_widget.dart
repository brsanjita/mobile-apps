import 'package:flutter/material.dart';
import 'package:store/models/document.dart';

class BankDocumentWidget extends StatefulWidget {
  final Document document;
  final Function onTap;

  const BankDocumentWidget({Key key,@required this.document,@required this.onTap}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BankDocumentWidgetState();

}

class _BankDocumentWidgetState extends State<BankDocumentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black12.withOpacity(0.2))
      ),
      child: ListTile(
        title:Text(widget.document.title),
        subtitle:Text(widget.document.description,overflow: TextOverflow.ellipsis,),
        trailing: IconButton(icon: Icon(Icons.chevron_right,color: Colors.black,), onPressed: (){}),
      ),
    );
  }

}