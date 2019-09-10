import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentScreenState();

}

class _PaymentScreenState extends State<PaymentScreen> {
  bool useWallet = false;
  bool isCashPayment = true;

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
            child: Text("Select Payment Methods", style: TextStyle(
                color: Colors.green,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),),
          ),
          CheckboxListTile(value: useWallet, onChanged: (val) {
            setState(() {
              useWallet = val;
            });
          }, title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Use wallet balance"),
              Text("( \$ 14500)")
            ],
          ),),
          RadioListTile(value: isCashPayment,
            groupValue: true,
            onChanged: (val) {
              setState(() {
                isCashPayment = true;
              });
            },
            title: Text("Cash Payment"),),
          RadioListTile(value: !isCashPayment,
            groupValue: true,
            onChanged: (val) {
              setState(() {
                isCashPayment = false;
                print("Cash Payment ${val}");
              });
            },
            title: Text("Pay online"),),
        ],
      ),
      bottomNavigationBar: RoundedButton(
        "Done", onPressed: () {
        Navigator.of(context).pop(
          {
            "useCash":isCashPayment,
            "useWallet":useWallet
          }
        );
      }, color: Colors.black,),
    );
  }

}