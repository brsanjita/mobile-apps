import 'package:common/widgets/custom_input_widget.dart';
import 'package:common/widgets/input/drop_input_widget.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:customer/screens/cab/cab_waiting_screen.dart';
import 'package:flutter/material.dart';

class CommonDeliveryDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommonDeliveryDetailsScreenState();

}

class _CommonDeliveryDetailsScreenState
    extends State<CommonDeliveryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomInputWidget(label: "Receiver Name",onSubmitted: (val){},),
              CustomInputWidget(label: "Receiver Mobile",onSubmitted: (val){},),
              CustomInputWidget(label: "Pickup Instruction",onSubmitted: (val){},),
              CustomInputWidget(label: "Delivery Instruction",onSubmitted: (val){},),
              DropInputWidget(label: "Select Package Type",values: ["Small","Big","Large"],onChanged: (val){},initialValue: "Small",),
              SizedBox(
                height: 12.0,
              ),
              RoundedButton("Deliver Now",onPressed: (){
                Navigator.of(context).pop();
              },color: Colors.black,)
            ],
          ),
        ),
      ),
    );
  }

}