import 'package:flutter/material.dart';

class RestaurantCartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RestaurantCartScreenState();
}

class _RestaurantCartScreenState extends State<RestaurantCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Cart Summary",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                ),
                FlatButton(onPressed: (){}, child: Text("CUSTOMIZE"))
              ],
            ),

          ],
        ),
      ),
    );
  }
}
