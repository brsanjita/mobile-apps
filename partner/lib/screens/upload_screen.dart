
import 'package:common/models/manage_document/document.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:partner/widgets/document_widget.dart';

class UploadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UploadScreenState();

}

class _UploadScreenState extends State<UploadScreen> {
  List<Document>documents=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Documents"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return DocumentWidget(document: documents[index],onTap: (){},);
      },itemCount: documents.length,shrinkWrap: true,),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12.0),
        child: RoundedButton("Continue",onPressed: (){},color: Colors.black,),
      ),
    );
  }
}
