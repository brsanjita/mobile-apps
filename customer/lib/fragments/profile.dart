import 'package:common/utils/trusted_http.dart';
import 'package:customer/screens/offers.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class ProfileFragment extends StatefulWidget {
  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  PackageInfo _packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
  );

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 100,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("My Account"),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Manage Profiles"),
              onTap: () {
                Navigator.pushNamed(context, "/manageProfile");
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Emergency Contacts"),
              onTap: () {
                Navigator.pushNamed(context, "/emergencyContacts");
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Payment Methods"),
              onTap: () {
                Navigator.pushNamed(context, "/paymentMethods");
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text("Offers"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OffersScreen(canApply: false,)));
              },
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text("Referrals"),
              onTap: () {
                Navigator.pushNamed(context, "/referrals");
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text("Invite Friends"),
              onTap: () {
                Navigator.pushNamed(context, "/inviteFriends");
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Support"),
              onTap: () {
                Navigator.pushNamed(context, "/support");
              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Logout"),
              onTap: () async{
                TrustedHttp.deleteToken();
                Navigator.popAndPushNamed(context, "/login");
              },
            ),
            Center(
              child: Text(
                  "App version: " +
                      _packageInfo.version +
                      " ( " +
                      _packageInfo.buildNumber +
                      " )",
                  style: TextStyle(color: Colors.grey)),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0)),
            Center(
              child: Text("Made with love in India!",
                  style: TextStyle(color: Colors.grey)),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0)),
          ],
        ))
      ],
    ));
  }
}
