import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Card"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.credit_card,
              size: 100.0,
            ),
          ),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.credit_card),
                        border: OutlineInputBorder(),
                        labelText: "Card Number"),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Expiration Date"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "CVV"),
                      ),
                    ),
                  ]
                      .map((child) => Expanded(
                            child: child,
                          ))
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RoundedButton("Add Card",onPressed: (){},color: Colors.black,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
