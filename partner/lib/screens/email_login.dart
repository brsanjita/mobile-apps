import 'package:common/widgets/custom_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:common/widgets/rounded_button.dart';

class EmailLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmailLoginScreenState();

}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomInputWidget(
                onSubmitted: (val){},
                label: "Email",
              ),
              CustomInputWidget(
                onSubmitted: (val){},
                label: "Password",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
                child: RoundedButton(
                  "Log In",
                  onPressed: (){},
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed('/forgotPassword');
                  },
                  child: Text("Forgot Password?",style: TextStyle(color: Colors.green,fontSize: 18.0),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed('/signup');
                  },
                  child: Text("Don't have an account?",style: TextStyle(fontSize: 20.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}