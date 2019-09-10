import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class InviteFriendScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InviteFriendScreenState();
}

class _InviteFriendScreenState extends State<InviteFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Invite Friends"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(72.0),
                  color: Colors.black,
                ),
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.mail,
                  size: 54.0,
                )),
            Text(
              "Share your Invite Code",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text("pr6744",
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.green)),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Invite your friend & we will give you \$ 10.00 credit in your wallet once your referred friend completes the 1st booking.",
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(12.0),
            child: RoundedButton("Invite Friends",
                onPressed: () {}, color: Colors.black)));
  }
}
