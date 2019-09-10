import 'package:flutter/material.dart';
import 'package:common/widgets/custom_input_widget.dart';
import 'package:common/widgets/rounded_button.dart';

class BankAccountSettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_BankAccountSettingScreenState();

}

class _BankAccountSettingScreenState extends State<BankAccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bank Account Details"),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical:12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:12.0),
                  child: Text(
                    "Please provide your bank details to get the money credited directly into your bank account.",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                  child: Text(
                    "*account beneficiary name must match your earlier uploaded document.",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: CustomInputWidget(
                    onSubmitted: (val) {},
                    label: "Payment Email",
                  ),
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
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: RoundedButton(
          "Finish",
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Important Notification",textAlign: TextAlign.center,),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "I hereby assure that all informationthat is providerd by me in this application is correct & I have read thourougly and agree to the tribe's terms of service. privte policy and partner agreements",
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RoundedButton("Agree & Apply", onPressed: (){
                        print("Baby");
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/bankReview');
                      },color: Colors.black,),
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