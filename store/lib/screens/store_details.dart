import 'package:flutter/material.dart';
import 'package:store/widgets/custom_input_widget.dart';
import 'package:store/widgets/options_dialog.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:store/widgets/tap_input_widget.dart';

class StoreDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StoreDetailsScreenState();

}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  String storeLocation,state,city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CustomInputWidget(
                label: "Contact Person Name",
                onSubmitted: (val){},
              ),
              TapInputWidget(
                label: "Select Store Location",
                onTap: (){},
                value: storeLocation,
              ),
              CustomInputWidget(onSubmitted: (val){}, label: "Store Address"),
              TapInputWidget(
                label: "State",
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) => OptionsDialog(
                        title: "Select state",
                        options: ["Assam", "Bihar", "Chandigarh"],
                        onSelected: (val) {
                          setState(() {
                            state = val;
                          });
                        },
                      ));
                },
                value: state,
              ),
              TapInputWidget(
                label: "City",
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) => OptionsDialog(
                        title: "Select City",
                        options: ["Delhi"],
                        onSelected: (val) {
                          setState(() {
                            city = val;
                          });
                        },
                      ));
                },
                value: city,
              ),
              CustomInputWidget(onSubmitted: (val){}, label: "Zip")
            ],
          ),
        ),
      ),
      bottomNavigationBar: RoundedButton("Submit",onPressed: (){},color: Colors.black,
      ),
    );
  }

}