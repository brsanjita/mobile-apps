import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store/widgets/document_widget.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:image_picker/image_picker.dart';

class StoreDocumentsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StoreDocumentsScreenState();
}

class _StoreDocumentsScreenState extends State<StoreDocumentsScreen> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Document"),
      ),
      body: ListView.builder(itemBuilder: (context,index)=>DocumentWidget(),itemCount: 4,)
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
}
