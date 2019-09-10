import 'package:common/models/user/mobile_number.dart';
import 'package:common/models/user/user.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:customer/screens/login/otp_screen.dart';
import 'package:customer/utils/user_controller.dart';
import 'package:customer/widgets/custom_input_widget.dart';
import 'package:customer/widgets/login/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class SignUpScreen extends StatefulWidget {
  final MobileNumber mobileNumber;

  const SignUpScreen({Key key,@required this.mobileNumber}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int orderCount = 2;
  String serviceType;
  String countryCode;
  bool agreed = false;
  String password;
  String confirmPassword;
  User user = User.named(gender: "Male");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    user.mobileNo=widget.mobileNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Account Details",
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomInputWidget(
                      label: "First Name",
                      onSubmitted: (val) {
                        user.firstName = val;
                      },
                      validator: (val) {
                        return val == '' ? "can not be empty" : null;
                      },
                    ),
                    CustomInputWidget(
                      label: "Last Name",
                      onSubmitted: (val) {
                        user.lastName = val;
                      },
                      validator: (val) {
                        return val == '' ? "can not be empty" : null;
                      },
                    ),
                    CustomInputWidget(
                      label: "Email",
                      onSubmitted: (val) {
                        user.email = val;
                      },
                      validator: (val) {
                        return val == '' ? "can not be empty" : null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DateTimeField(

                        format: DateFormat('yyyy-MM-dd'),
                        decoration: InputDecoration(
                            labelText: "Date of birth",
                            hasFloatingPlaceholder: true,
                            border: OutlineInputBorder()),
                        onChanged: (dt) {
                          user.createdAt = dt;
                        },
                      ),
                    ),
                    CustomInputWidget(
                      label: "Password",
                      obscure: true,
                      onSubmitted: (val) {
                        this.password = val;
                      },
                      validator: (val) {
                        return val == '' ? "can not be empty" : null;
                      },
                    ),
                    CustomInputWidget(
                      label: "Confirm Password",
                      onSubmitted: (val) {
                        this.confirmPassword = val;
                      },
                      validator: (val) {
                        return val != password
                            ? "Passwords do not match"
                            : null;
                      },
                    ),
                    CustomInputWidget(
                      label: "Invite Promo Code",
                      onSubmitted: (val) {
                        user.referralCode = val;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Choose your gender",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                user.gender = 'Male';
                              });
                            },
                            child: GenderWidget(
                              title: "Male",
                              image: "assets/images/male.png",
                              isSelected: user.gender == 'Male',
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                user.gender = 'Female';
                              });
                            },
                            child: GenderWidget(
                              isSelected: user.gender == 'Female',
                              title: "Female",
                              image: "assets/images/female.png",
                            )),
                      ]
                          .map((child) => Expanded(
                                child: child,
                              ))
                          .toList(),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: agreed,
                            onChanged: (val) {
                              setState(() {
                                agreed = val;
                              });
                            }),
                        RichText(
                            text: TextSpan(
                                children: [
                              TextSpan(text: "I agree to the "),
                              TextSpan(
                                  text: "Terms, Conditions & Private Policy",
                                  style: TextStyle(
                                      color: Colors.green,
                                      decoration: TextDecoration.underline)),
                            ],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundedButton(
          "Finish",
          onPressed: () {
            if (agreed) if (formKey.currentState.validate()) {

              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      content: Container(
                        height: 50.0,
                        child: Row(
                          children: <Widget>[
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Creating User"),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
              UserController.signUpWithEmail(user, password).then((val)async{
                if(val){
                  Navigator.of(context).pop();
                  await
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OTPScreen(mobileNumber: widget.mobileNumber,)));
                }
                else{
                  Navigator.of(context).pop();
                  showDialog(context: context,barrierDismissible: true,builder: (context)=>AlertDialog(title: Text("Oops somet error occured!",),));
                }
              });
            }
          },
          color: Colors.black,
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
