import 'package:common/models/user/mobile_number.dart';
import 'package:common/models/user/user.dart';
import 'package:common/screens/bank/bank_account_settings.dart';
import 'package:common/screens/bookings/bookings_screen.dart';
import 'package:common/screens/manage_documents/manage_documents.dart';
import 'package:common/screens/notifications/notifications.dart';
import 'package:common/screens/profile/profile.dart';
import 'package:common/screens/support/support.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreen(
                  user: User.named(
                      firstName: "Bhavneet",
                      lastName: "Singh",
                      mobileNo: MobileNumber(
                          countryCode: "91", number: "9599752879"),language: "English",currency: "INR"),
                ),
              )); // close the drawer
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BankAccountSettingScreen())); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Documents'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ManageDocumentScreen(
                        user: User.named(),
                      ))); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Bookings'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BookingsScreen())); // close the drawer
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
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: () {
              // change app state...
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      NotificationsScreen())); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Support'),
            onTap: () {
              // change app state...
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SupportScreen())); // close the drawer
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
