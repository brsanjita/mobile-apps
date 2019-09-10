import 'package:flutter/material.dart';

class BookSuccessScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookSuccessScreenState();
}

class _BookSuccessScreenState extends State<BookSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: MediaQuery.of(context).size.width/2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Booking Done",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,),),
            )
          ],
        ),
      ),
    );
  }
}
