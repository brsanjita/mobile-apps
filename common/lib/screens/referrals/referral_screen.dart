import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ReferralScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Referrals"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(

              child: Image.asset('assets/images/gift.gif'),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Referrals".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 3 / 4,
                child: Text(
                  "Refer a friend & we'will give you &your buddy Rs 100 off on nyour next orders above Rs 199",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  "Valid till 31st July 2019",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, color: Colors.black54),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedButton(
                "Invite & Learn",
                onPressed: () {
                  Share.share("Earn Rs100 by installing Tribe App");
                },
                color: Colors.black,
              ),
            )
          ],
        ));

  }
}
