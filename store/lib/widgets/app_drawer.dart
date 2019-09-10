import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Balamurali P"),
            accountEmail: Text("Store Supervisor"),
            // decoration: BoxDecoration(color: const Color(0xFF00897b)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              // change app state...
              Navigator.popAndPushNamed(
                  context, "/profile"); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Earnings'),
            onTap: () {
              // change app state...
              Navigator.popAndPushNamed(
                  context, "/earnings"); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.menu),
            title: Text('Store Menu'),
            onTap: () {
              // change app state...
              Navigator.popAndPushNamed(
                  context, "/storemenu"); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Bank Details'),
            onTap: () {
              // change app state...
              Navigator.popAndPushNamed(
                  context, "/bankdetails"); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Documents'),
            onTap: () {
              // change app state...
              Navigator.popAndPushNamed(
                  context, "/storedocuments"); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.timeline),
            title: Text('Order Statistics'),
            onTap: () {
              // change app state...
              Navigator.popAndPushNamed(
                  context, "/orderstatistics"); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Support'),
            onTap: () {
              // change app state...
              Navigator.popAndPushNamed(
                  context, "/support"); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // change app state...
              Navigator.popAndPushNamed(
                  context, "/settings"); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Logout'),
            onTap: () {
              // change app state...
              Navigator.popAndPushNamed(
                  context, "/login"); // close the drawer go to login page
            },
          ),
        ],
      ),
    );
  }


}
