import 'package:common/widgets/custom_input_widget.dart';
import 'package:common/widgets/input/options_dialog.dart';
import 'package:common/widgets/input/tap_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:common/widgets/rounded_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int orderCount = 2;
  String serviceType;
  String countryCode;
  bool agreed=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomInputWidget(
                label: "Store Name",
                onSubmitted: (val) {},
              ),
              CustomInputWidget(
                label: "Email",
                onSubmitted: (val) {},
              ),
              TapInputWidget(
                  label: "Select Service Type",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => OptionsDialog(
                              title: "Select Language",
                              options: ["Food Delivery", "Grocery Delivery", "Wine Delivery"],
                              onSelected: (val) {
                                setState(() {
                                  serviceType = val;
                                });
                              },
                            ));
                  },
                  value: serviceType),
              CustomInputWidget(
                label: "Password",
                obscure: true,
                onSubmitted: (val) {},
              ),
              CustomInputWidget(
                label: "Confirm Password",
                obscure: true,
                onSubmitted: (val) {},
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TapInputWidget(
                          label: "Country",
                          value: countryCode,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => OptionsDialog(
                                      title: "Country Code",
                                      options: ["+91", "+00", "+15"],
                                      onSelected: (val) {
                                        setState(() {
                                          countryCode = val;
                                        });
                                      },
                                    ));
                          })),
                  Expanded(
                      child: CustomInputWidget(
                    label: "Mobile",
                    onSubmitted: (val) {},
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(value: agreed, onChanged: (val) {
                    setState(() {
                      agreed=val;
                    });
                  }),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "I agree to the "),
                    TextSpan(
                        text: "Terms, Conditions & Private Policy",
                        style: TextStyle(color: Colors.green,decoration: TextDecoration.underline)),
                  ], style: TextStyle(color: Colors.black, fontSize: 14.0)))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                child: RoundedButton("Register",onPressed: (){},color: Colors.black,),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('/emailLogin');
          },
          child: Container(
            height: 56.0,
            child: Center(
              child: Text("Already have an account? Sign in",style: TextStyle(color: Colors.white,fontSize: 18.0),),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputWidget(
    String label,
    Function(String) onSubmitted,
  ) {
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
}
