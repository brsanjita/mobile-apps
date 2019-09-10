import 'package:common/models/manage_document/document.dart';
import 'package:flutter/material.dart';

class DocumentWidget extends StatefulWidget {
  final Document document;
  final Function onTap;

  const DocumentWidget({Key key,@required this.document,@required this.onTap}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DocumentWidgetState();

}

class _DocumentWidgetState extends State<DocumentWidget> {
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
        subtitle:Row(
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: Text(widget.document.description,overflow: TextOverflow.ellipsis,)),
                Icon(Icons.info_outline,size: 20.0,)
              ],
            )),
          ],
        ),
        trailing: IconButton(icon: Icon(Icons.chevron_right,color: Colors.black,), onPressed: (){}),
      ),
    );
  }

}