import 'package:flutter/material.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:common/screens/manage_documents/upload_screen.dart';

class DocumentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Store/Resturant license", style: TextStyle(fontSize: 18.0)),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Missing",
                style: TextStyle(color: Colors.black54, fontSize: 14.0),
              ),
            )
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.error,
              color: Colors.red,
            ),
            IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: () {})
          ],
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedButton(
              "Upload Document",
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UploadDocumentScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
