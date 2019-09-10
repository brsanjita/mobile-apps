import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store/widgets/change_password_dialog.dart';
import 'package:store/widgets/options_dialog.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:store/widgets/tap_input_widget.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  String email,name,countryCode,mobile,language,currency;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                  email=val;
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
                      options: ["Kurdi", "Malayu", "Hindi"],
                      onSelected: (val) {
                        setState(() {
                          language=val;
                        });
                      },
                    ));
              },value: language
              ),
              buildTapInputWidget("Currency", () {
                showDialog(
                    context: context,
                    builder: (context) => OptionsDialog(
                          title: "Currency",
                          options: ["INR", "USD", "CAD"],
                          onSelected: (val) {
                            setState(() {
                              currency=val;
                            });
                          },
                        ));
              },currency),
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
