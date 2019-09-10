import 'package:flutter/material.dart';
import 'package:common/widgets/rounded_button.dart';

class ReviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReviewScreenState();

}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Review"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:16.0),
            child: Text("Hi Balamurali",style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.w600),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("Thanks for Applying.\nYour Application is under review",style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("your application code is: XJDRERION",style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("To assure safety and quality of services provides through our marketplace.We thought check the partner applications to meet our standards",style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.w500),),
          ),
          Padding(
            padding: EdgeInsets.all(8.00),
            child: RoundedButton("What's Next?",onPressed: (){},),
          )
        ],
      ),
    );
  }

}