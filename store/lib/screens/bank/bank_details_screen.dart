import 'package:flutter/material.dart';
import 'package:store/models/document.dart';
import 'package:store/widgets/bank_document_widget.dart';
import 'package:store/widgets/drop_input_widget.dart';
import 'package:common/widgets/rounded_button.dart';

class BankDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  List<String> documents = ['Document1', "Document2", "Document3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Business Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropInputWidget(
                label: "Business Type",
                initialValue: "Partnership",
                values: ["Partnership", "Sole Proprietorship"],
                onChanged: (val) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropInputWidget(
                label: "What is your businnes info?",
                initialValue: "Groceries",
                values: ["Electronics", "Groceries"],
                onChanged: (val) {},
              ),
            ),
            ListTile(
              title: Text("Please keep this documents ready to upload in the next screen"),
            ),
            ListView.builder(
              itemBuilder: (context, index) =>BankDocumentWidget(document: Document(title: documents[index],description: "Please add original photos "),onTap: (){},),
              itemCount: documents.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundedButton("Continue",onPressed: (){
          Navigator.of(context).pushNamed('/bankUpload');
        },color: Colors.black,),
      ),
    );
  }
}
