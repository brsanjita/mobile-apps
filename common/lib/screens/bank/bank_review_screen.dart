import 'package:flutter/material.dart';
import 'package:common/widgets/rounded_button.dart';

class BankReviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BankReviewScreenState();

}

class _BankReviewScreenState extends State<BankReviewScreen> {
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
            child: Text("Hi Balamurali",style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.w600),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("Thanks for Applying.\nYour Application is under review",style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w500),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("your application code is: XJDRERION",style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.w500),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.all(54.0),
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("To assure safety and quality of services provides through our marketplace.We thought check the partner applications to meet our standards",style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.w500),textAlign: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 16.0),
            child: RoundedButton("What's Next?",onPressed: (){
              Navigator.of(context).pushNamed('/bankInstructions');
            },color: Colors.black,),
          )
        ],
      ),
    );
  }

}