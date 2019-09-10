import 'package:common/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:common/widgets/douments/document_widget.dart';

class ManageDocumentScreen extends StatefulWidget {
  final User user;

  const ManageDocumentScreen({Key key,@required this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ManageDocumentScreenState();
}

class _ManageDocumentScreenState extends State<ManageDocumentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Document"),
      ),
      body: ListView.builder(itemBuilder: (context,index)=>DocumentWidget(),itemCount: 4,)
    );
  }


}
