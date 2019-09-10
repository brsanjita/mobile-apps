
import 'package:flutter/material.dart';
import 'package:common/models/manage_document/document.dart';
import 'package:common/widgets/bank/bank_document_widget.dart';
import 'package:common/widgets/rounded_button.dart';

class BankUploadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BankUploadScreenState();

}

class _BankUploadScreenState extends State<BankUploadScreen> {
  List<Document>documents=[
    Document(title: "Addhaar", description: "Should container your UID")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Upload Documents"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return BankDocumentWidget(document: documents[index],onTap: (){},);
      },itemCount: documents.length,shrinkWrap: true,),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12.0),
        child: RoundedButton("Continue",onPressed: (){
          Navigator.of(context).pushNamed('/bankAccountSettings');
        },color: Colors.black,),
      ),
    );
  }
}
