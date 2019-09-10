import 'package:common/screens/login/login_email.dart';
import 'package:common/screens/login/mobile_login.dart';
import 'package:common/widgets/login/login_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin<LoginScreen> {
  int index = 0;
  AnimationController controller;
  bool signUp = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1), value: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (index == 1) {
          popBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.redAccent,
        body: Column(
          children: <Widget>[
            Expanded(child: buildLoginHeader()),
            Container(
                color: Colors.white,
                child: index == 0 ? buildLoginOptions() : buildLoginForm())
          ],
        ),
      ),
    );
  }

  void popForward() {
    setState(() {
      index = 1;
    });
    controller.forward();
  }

  void popBack() {
    controller.reverse();
    setState(() {
      index = 0;
    });
  }

  Widget buildLoginHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,

        ///image: DecorationImage(
        //image: NetworkImage(
        //    "http://appbee.in/Images/appbee-mobile-background-home.jpg"),
        //fit: BoxFit.cover)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Center(
            child: Text(
              "tribe",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 90.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Product Sans"),
            ),
          )),
          index == 1
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    popBack();
                  })
              : Container(
                  width: 0.0,
                  height: 0.0,
                )
        ],
      ),
    );
  }

  Widget buildLoginOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            elevation: 1.0,
            padding: EdgeInsets.all(18.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            onPressed: () {
              setState(() {
                signUp = true;
              });
              popForward();
            },
            child: Text(
              "Create New Account",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0),
            ),
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: OutlineButton(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              padding: EdgeInsets.all(18.0),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  signUp = false;
                });
                popForward();
              },
              child: Text(
                "Log In Back",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "By signing you agree to our Private Policy. Cookies Policy and confirm that you ar atleast 16 years old.",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginForm() {
    String text = signUp ? "Sign up" : "Sign in";
    return FadeTransition(
      opacity: controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "${signUp ? "SignUp With" : "Log Back In"}",
                  style: TextStyle(fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "${signUp ? "with a new account" : "with an existing account"}",
                    style: TextStyle(fontSize: 18.0, color: Colors.black54),
                  ),
                ),
              ],
            ),
            LoginButton("$text with Email", color: Colors.green, onPressed: () {
              if (text == "Sign up") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MobileLoginScreen()));
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginEmailScreen()));
              }
            },
                leading: Icon(
                  Icons.mail,
                  color: Colors.white,
                )),

            LoginButton("$text with SMS",
                onPressed: () {},
                color:Colors.black,
                leading: Icon(
                  Icons.sms,
                  color: Colors.white,
                )),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                "By signing you agree to our Private Policy. Terms of service and confirm that you ar atleast 16 years old.",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
          ]
              .map((button) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: button,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
