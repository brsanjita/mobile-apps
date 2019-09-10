import 'package:common/models/user/user.dart';
import 'package:flutter/material.dart';

import 'package:common/widgets/custom_input_widget.dart';

class ChangePasswordDialog extends StatefulWidget {
  final User user;
  const ChangePasswordDialog({Key key,@required this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ChangePasswordDialogState();

}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  String currentPassword='',newPassword='',confirmPassword='';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Change Password"),
      content: Container
        (
      width: MediaQuery.of(context).size.width*3.5/4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomInputWidget(
              onSubmitted: (val){
                currentPassword=val;
              },
              label: "Enter Current Password",

            ),
            CustomInputWidget(
              onSubmitted: (val){
                newPassword=val;
              },
              label: "Enter New Password",
            ),
            CustomInputWidget(
              onSubmitted: (val){
                confirmPassword=val;
              },
              label: "Enter Confirm Password",
              obscure: true,
            ),

          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){}, child: Text("Cancel")),
        FlatButton(onPressed: (){}, child: Text("Ok"))
      ],
    );
  }

}