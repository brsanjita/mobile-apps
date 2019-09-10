import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                Text("Tribe Store",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38.0,
                        fontFamily: "Product Sans",
                        decoration: TextDecoration.none)),
                Text("")
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: ButtonTheme(
                    minWidth: 250.0,
                    height: 30.0,
                    buttonColor: Colors.white,
                    child: RaisedButton(
                      child: Text("Create New Account"),
                      padding: const EdgeInsets.all(15.0),
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ButtonTheme(
                      buttonColor: Colors.white,
                      minWidth: 250.0,
                      height: 30.0,
                      child: RaisedButton(
                        child: Text("Log Back In"),
                        padding: const EdgeInsets.all(15.0),
                        onPressed: () {
                          Navigator.pushNamed(context, "/home");
                        },
                      ))),
              Text(
                "By signing up you agree to our ToS, Privacy Policy, and confirm that you are eligible to do business as per laws of your country/state.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                    fontFamily: "Product Sans",
                    decoration: TextDecoration.none),
              )
            ],
          ),
//               )
//             Positioned(
//               left: 0.0,
//               right: 0.0,
//               bottom: 0.0,
//               child: Container(
//                         padding: EdgeInsets.all(16.0),
// child:  Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
//                     child: ButtonTheme(
//                         minWidth: 250.0,
//                         height: 30.0,
//                         buttonColor: Colors.white,
//                         child: RaisedButton(
//                           child: Text("Create New Account"),
//                           padding: const EdgeInsets.all(15.0),
//                           onPressed: () {
//                             Navigator.pushNamed(context, "/signup");
//                           },
//                         )),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: ButtonTheme(
//                           buttonColor: Colors.white,
//                           minWidth: 250.0,
//                           height: 30.0,
//                           child: RaisedButton(
//                             child: Text("Log Back In"),
//                             padding: const EdgeInsets.all(15.0),
//                             onPressed: () {
//                               Navigator.pushNamed(context, "/home");
//                             },
//                           ))),
//                   Text(
//                     "By signing up you agree to our ToS, Privacy Policy, and confirm that you are eligible to do business as per laws of your country/state.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 10.0,
//                         fontFamily: "Product Sans",
//                         decoration: TextDecoration.none),
//                   )
//                 ],
//               ),
//               )
//             )
        )
      ],
    ));
  }
}
