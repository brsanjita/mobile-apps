import 'dart:math';
import 'package:common/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:common/widgets/profile/change_password_dialog.dart';
import 'package:common/widgets/input/options_dialog.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:common/widgets/input/tap_input_widget.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  const EditProfileScreen({Key key,@required this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    User user=widget.user;
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"), actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (context) => [
                PopupMenuItem<int>(
                  child: Text(
                    "View Profile",
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
          onSelected: (val) {
            if (val == 0) {
              Navigator.of(context).pop();
            }          else{
              showDialog(context: context,builder: (context)=>ChangePasswordDialog());
            }
          },
        )
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildInputWidget("Restaurant Name", (val) {}),
              buildInputWidget("Email", (val) {
                setState(() {
                  user.email=val;
                });
              }),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextField(
                        onTap: () => {},
                        decoration: InputDecoration(
                            labelText: "Country",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                      ),
                    ),
                  ),
                  Expanded(child: buildInputWidget("Mobile", (val) {})),
                ],
              ),
              TapInputWidget(
                 label: "Language",onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => OptionsDialog(
                      title: "Select Language",
                      options: ["Kurdi", "Malayu", "Hindi","English"],
                      onSelected: (val) {
                        setState(() {
                          user.language=val;
                        });
                      },
                    ));
              },value: user.language
              ),
              buildTapInputWidget("Currency", () {
                showDialog(
                    context: context,
                    builder: (context) => OptionsDialog(
                          title: "Currency",
                          options: ["INR", "USD", "CAD"],
                          onSelected: (val) {
                            setState(() {
                              user.currency=val;
                            });
                          },
                        ));
              },user.currency),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RoundedButton(
                  "Update Information",
                  onPressed: () {},
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputWidget(String label, Function(String) onSubmitted,) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        onChanged: onSubmitted,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          hasFloatingPlaceholder: true,

        ),
      ),
    );
  }

  Widget buildTapInputWidget(String label, Function onTap,String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Stack(
        children: <Widget>[
          TextField(
              controller: TextEditingController(text: val),
              decoration: InputDecoration(
                  labelText: label,
                  hasFloatingPlaceholder: true,
                  border: OutlineInputBorder(),
                  suffixIcon: Transform.rotate(
                      angle: pi / 2, child: Icon(Icons.chevron_right)))),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 60.0,
              color: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
