import 'package:flutter/material.dart';
import 'package:common/widgets/custom_input_widget.dart';
import 'package:common/widgets/rounded_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password?"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.lock_open,color: Colors.green,size: 100.0,),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("We just need your registered Email id to send you password reset instruction",style: TextStyle(fontSize: 18.0),textAlign: TextAlign.center,),
              ),
              CustomInputWidget(label: "Email",onSubmitted: (val){},),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 8.0),
                child: RoundedButton(
                  "Continue",
                  onPressed: (){},
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}