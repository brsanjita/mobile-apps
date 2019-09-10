import 'package:common/widgets/input/drop_input_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> documents = ['Document1', "Document2", "Document3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropInputWidget(
              label: "Business Type",
              initialValue: "Partnership",
              values: ["Partnership", "Sole Proprietorship"],
              onChanged: (val) {},
            ),
            DropInputWidget(
              label: "What is your businnes info?",
              initialValue: "Groceries",
              values: ["Electronics", "Groceries"],
              onChanged: (val) {},
            ),
            ListTile(
              title: Text("Please keep this documents ready to upload in the next screen"),
            ),
            ListView.builder(
              itemBuilder: (context, index) {},
              itemCount: documents.length,
              shrinkWrap: false,
              physics: ClampingScrollPhysics(),
            )
          ],
        ),
      ),
    );
  }
}
