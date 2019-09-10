import 'package:common/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:common/widgets/profile/change_password_dialog.dart';
import 'package:common/screens/profile/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({Key key, @required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget build(BuildContext context) {
    User user = widget.user;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) =>
            [
              PopupMenuItem<int>(
                child: Text(
                  "Edit Profile",
                ),
                value: 0,
              ),
              PopupMenuItem<int>(
                child: Text(
                  "Change Password",
                ),
                value: 1,
              ),
            ],
            onSelected: (index) {
              if (index == 0) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditProfileScreen(user: user)));
              } else {
                showDialog(
                    context: context,
                    builder: (context) => ChangePasswordDialog(user: user));
              }
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: buildItem("First Name", "${user.firstName}")),
              Expanded(child: buildItem("Last Name", "${user.lastName}"))
            ],
          ),
          buildItem("Email", "${user.email}"),
          buildItem("Mobile", "${user.mobileNo}"),
          buildItem("Language", "${user.language}"),
          buildItem("Currency", "${user.currency}"),
        ],
      ),
    );
  }

  Widget buildItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(color: Colors.green, fontSize: 16.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              value,
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
