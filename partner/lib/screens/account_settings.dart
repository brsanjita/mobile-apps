import 'package:flutter/material.dart';
import 'package:common/widgets/custom_input_widget.dart';
import 'package:common/widgets/rounded_button.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Account Details"),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Please provide your bank details to get the money credited directly into your bank account.",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "*account beneficiary name must match your earlier uploaded coument.",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomInputWidget(
                onSubmitted: (val) {},
                label: "Payment Email",
              ),
              CustomInputWidget(
                onSubmitted: (val) {},
                label: "Bank Account No",
              ),
              CustomInputWidget(
                onSubmitted: (val) {},
                label: "IFSC Code",
              ),
              CustomInputWidget(
                onSubmitted: (val) {},
                label: "Bank Location",
              ),
            ],
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: RoundedButton(
          "Finish",
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Important Notification"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "I hereby assure that all informationthat is providerd by me in this application is correct & I have read thourougly and agree to the tribe's terms of service. privte policy and partner agreements",
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RoundedButton("Agree & Apply", onPressed: (){},color: Colors.black,),
                    )
                  ],
                ),
              ),
            );
          },
          color: Colors.black,
        ),
      ),
    );

  }
}