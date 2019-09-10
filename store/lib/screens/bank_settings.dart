import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/widgets/custom_input_widget.dart';
import 'package:common/widgets/rounded_button.dart';

class BankSettingsScreen extends StatefulWidget {
  @override
  _BankSettingsScreenState createState() => _BankSettingsScreenState();
}

class _BankSettingsScreenState extends State<BankSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Settings"),
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
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
        padding: const EdgeInsets.all(16.0),
        child: RoundedButton(
          "Submit",onPressed: (){},color: Colors.black,
        ),
      ),
    );
  }
}
