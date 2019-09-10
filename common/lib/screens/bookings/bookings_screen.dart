import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                TabBar(
                  tabs: ["Pending", "Upcoming", "Past"].map((val) {
                    return Tab(text: val);
                  }).toList(),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black26,
                  labelStyle:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500,color: Colors.black),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black26,
                      fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: TabBarView(
                      children: [
                    "Not Avaiable",
                    "Not Avaiable",
                    "Not Avaiable",
                  ]
                          .map((val) => Center(
                                child: Text(
                                  val,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ))
                          .toList()),
                )
              ],
            )),
      ),
    );
  }
}
