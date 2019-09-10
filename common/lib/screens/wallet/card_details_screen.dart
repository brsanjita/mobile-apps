import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'add_card_screen.dart';

class CardDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardDetailsScreenState();

}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 240.0,
              floating: false,
              pinned: true,
              title: Text('Card Details'),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Padding(
                  padding: const EdgeInsets.only(top:70.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "No Card Available",
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text("Please add your card to use card payment",
                              style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12.0),
                          child: RoundedButton("Add Card", onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddCardScreen()));
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 18.0),
                    child: Text("Notes",style: TextStyle(fontSize: 20.0,color: Colors.green),),
                  ),
                  buildSampleCard()
                ]))
          ],
        ));
  }

  Widget buildSampleCard(){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Table(
          children: [
            TableRow(
              children: [
                Text("Card Type",style: TextStyle(fontSize: 18.0),),
                Text("Visa",style: TextStyle(fontSize: 18.0),),
              ]
            ),
            TableRow(
                children: [
                  Text("Card Number",style: TextStyle(fontSize: 18.0),),
                  Text("4111 XXXX XXXX 1234",style: TextStyle(fontSize: 18.0),),
                ]
            ),
            TableRow(
                children: [
                  Text("Expiry",style: TextStyle(fontSize: 18.0),),
                  Text("13/2023",style: TextStyle(fontSize: 18.0),),
                ]
            ),
            TableRow(
                children: [
                  Text("CVV",style: TextStyle(fontSize: 18.0),),
                  Text("123",style: TextStyle(fontSize: 18.0),),
                ]
            )
          ],
        ),
      ),
    );
  }
}