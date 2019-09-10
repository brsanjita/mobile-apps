import 'dart:async';
import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with TickerProviderStateMixin {
  TextEditingController loginTextController,
      otpTextController,
      firstNameTextController,
      lastNameTextController;
  TabController tabController;
  String otp = "";
  String mobileNumber = "";
  int currentPage = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginTextController = TextEditingController();
    otpTextController = TextEditingController();
    firstNameTextController = TextEditingController();
    lastNameTextController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black,
                )),
            Expanded(
                flex: 3,
                child: Container(
                  color: Color(0xffeeeeee),
                ))
          ],
        ),
        WillPopScope(
          onWillPop: () {
            pop();
          },
          child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                brightness: Brightness.dark,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios), onPressed: pop),
              ),
              backgroundColor: Colors.transparent,
              body: Center(
                  child:
                      currentPage == 0 ? getMobileScreen() : getOTPScreen())),
        ),
      ],
    );
  }

  void pop() {
    if (currentPage == 1) {
      setState(() {
        currentPage = 0;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  Widget getMobileScreen() {
    print("Mobile Number $mobileNumber");
    String query = """mutation {
      requestLoginOTP(mobileNo:$mobileNumber)
      }
    """;
    print("Query $query");
    return Mutation(
        options: MutationOptions(document: query,variables: {
          'mobileNo':mobileNumber
        }),
        builder: (runMutation, result) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "images/mobile.png",
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          "Verify your Number",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                              "Please enter your mobile number to receive a verification code. Carrier rates may Apply.",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  height: 1.1),
                              textAlign: TextAlign.center)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 12.0),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                              prefixText: "+91-",
                              hintStyle: TextStyle(color: Colors.black38),
                              prefixStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                              labelText: "Enter your mobile number",
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black54)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700),
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: false, signed: true),
                          controller: loginTextController,
                          onChanged: (val) {
                            this.mobileNumber = val;
                          },
                          onSubmitted: (value) {
                            print(value);
                            runMutation({"mobileNo": mobileNumber});
                            return true;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        child: RoundedButton(
                          "Get OTP",
                          color: Colors.black,
                          onPressed: () {
                            runMutation({"mobileNo":mobileNumber});
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Terms and Conditions",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },onCompleted: (result){
          print(result);
          login();
    },);
  }

  Widget getOTPScreen() {
    print("Mobile Number $mobileNumber");
    String query = """mutation {
      requestLoginOTP(\$mobileNo:mobileNumber!)
      }
    """;
    print("Query $query");
    return Mutation(
      options: MutationOptions(document: query),
      builder: (runMutation, result) {
        print("Result ${result.data}");
        if (result.loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (result.data == null || !result.data) {
          return Center(child: Text("Something wrong happened"));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "images/otp.png",
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        "Enter your OTP",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                            "Please enter one time password to verify your mobile number so to proceed",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                                height: 1.1),
                            textAlign: TextAlign.center)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 12.0),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: "Enter one time password",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: true),
                        controller: otpTextController,
                        onSubmitted: (value) {
                          verify();
                          return true;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: RoundedButton(
                        "Verify & Proceed",
                        color: Colors.black,
                        onPressed: verify,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Didn't receive code? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                )),
                            InkWell(
                              onTap: login,
                              child: Text(
                                "Resend OTP",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getDetailsScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/otp.png",
                    width: MediaQuery.of(context).size.width / 3.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Enter your Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                        "Please enter your details ie first name and last name.",
                        style: TextStyle(
                            color: Colors.black54, fontSize: 16.0, height: 1.1),
                        textAlign: TextAlign.center)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "Enter first name",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: false, signed: true),
                    controller: firstNameTextController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "Enter Last Name",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: false, signed: true),
                    controller: lastNameTextController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  child: RoundedButton(
                    "Get Started",
                    color: Colors.black,
                    onPressed: enterDetails,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Didn't receive code? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            )),
                        InkWell(
                          onTap: login,
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void enterDetails() {}
  void login() {
    setState(() {
      currentPage = 1;
    });
  }

  void showLoadingDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0),
            ),
            content: Container(
              alignment: Alignment.center,
              height: 100.0,
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  void verify() {
    showLoadingDialog("Validating OTP");
    Future.delayed(Duration(seconds: 1)).then((val) {
      showError("Please enter valid OTP");
    });
  }

  void showError(String message) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: "Ok",
          onPressed: () {},
        ),
      ),
    );
  }
}
