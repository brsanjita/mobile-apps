import 'dart:io';

import 'package:flutter/material.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Document"),
      ),
      body: GestureDetector(
        onTap: getImage,
        child: Image.asset(
          "assets/document.jpg",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RoundedButton(
          "Submit",
          onPressed: (){},
          color: Colors.black,
        ),
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
}
