import 'package:flutter/material.dart';

class BookRentalScreen extends StatefulWidget {
  @override
  _BookRentalScreenState createState() => _BookRentalScreenState();
}

class _BookRentalScreenState extends State<BookRentalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Offers & Promotions"),
        ),
        body: Container(
          child: Center(
            child: Text(
              'Tribe',
              style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 70.00),
            ),
          ),
        ));
  }
}
