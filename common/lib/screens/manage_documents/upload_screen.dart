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
      body: Center(
        child: _image != null
            ? buildFileDetails()
            : InkWell(
                onTap: getImage,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.insert_drive_file,
                        size: 64.0,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Select Document",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RoundedButton(
          "Submit",
          onPressed: () {},
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildFileDetails() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.file(
          _image,
          height: 150.0,
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Text(
                "${_image.path}",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
              ),
            ),
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _image = null;
                  });
                })
          ],
        )
      ],
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
}
