import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({Key key, this.message="Loading"}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: Container(
        height: 54.0,
        child: Row(
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
            SizedBox(width: 12.0,),
            Text(message)
          ],
        ),
      ),
    );
  }

}