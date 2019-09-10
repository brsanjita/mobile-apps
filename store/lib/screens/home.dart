import 'package:flutter/material.dart';
import 'package:store/fragments/delivered_orders.dart';
import 'package:store/fragments/new_orders.dart';
import 'package:store/fragments/processing_orders.dart';
import 'package:store/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int newOrderCount = 2;
  int processingOrderCount = 2;
  int dispatchedOrderCount = 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "New ($newOrderCount)"),
              Tab(text: "Processing ($processingOrderCount)"),
              Tab(text: "Dispatched ($dispatchedOrderCount)"),
            ],
            indicatorColor: Colors.black,
          ),
          title: Text("Orders"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {},
            ),
            new IconButton(
              icon: new Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, "/notifications");
              },
            ),
          ],
        ),
        drawer:AppDrawer(),
        body: TabBarView(
          children: [
            NewOrdersFragment(),
            ProcessingOrdersFragment(),
            DeliveredOrdersFragment()
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
