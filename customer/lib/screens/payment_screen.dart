import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentScreenState();

}

class _PaymentScreenState extends State<PaymentScreen> {
  bool useWallet=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile & Payment"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Select Payment Methods",style: TextStyle(color: Colors.green,fontSize: 16.0,fontWeight: FontWeight.w600),),
          ),
          CheckboxListTile(value: useWallet, onChanged: (val){},title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Use wallet balance"),
              Text("( \$ 14500)")
            ],
          ),),
          RadioListTile(value: false, groupValue: false, onChanged: (val){},title: Text("Cash Payment"),),
          RadioListTile(value: true, groupValue: false, onChanged: (val){},title: Text("Pay online"),),
        ],
      ),
      bottomNavigationBar: RoundedButton("Done",onPressed: (){},color: Colors.black,),
    );
  }

}