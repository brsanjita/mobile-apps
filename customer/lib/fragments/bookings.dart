import 'package:flutter/material.dart';

class BookingsFragment extends StatefulWidget {
  @override
  _BookingsFragmentState createState() => _BookingsFragmentState();
}

class _BookingsFragmentState extends State<BookingsFragment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // The number of tabs / content sections we need to display
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Bookings"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {},
                )
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Past",
                  ),
                  Tab(
                    text: "Upcoming",
                  ),
                ],
              ),
            ),
            body: Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Center(child: Text("Bookings")),
            )));
  }
}
