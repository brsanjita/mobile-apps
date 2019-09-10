
import 'package:common/screens/wallet/card_details_screen.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final double appBarHeight = 60.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 220.0,
          floating: false,
          pinned: true,
          leading: Icon(Icons.credit_card),
          title: Text('My Wallet'),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Padding(
              padding: const EdgeInsets.only(top:60.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Your Balance",
                        style: TextStyle(fontSize: 16.0, color: Colors.white54)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "\$ 14500.04",
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RoundedButton("View Transactions", onPressed: () {
                        Navigator.of(context).pushNamed('/walletTransactions');
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
            delegate: SliverChildListDelegate.fixed([_buildAddMoneyOption()]))
      ],
    ));
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController editingController = TextEditingController();

  Widget _buildAddMoneyOption() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(
              "Add Money",
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(
              "Add Money",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:16.0),
            child: Form(
                key: key,
                child: TextFormField(
                  validator: (val) {
                    return val == null || val.length == 0 ? "Required" : null;
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                    labelText: "Recharge Amount",
                    border: OutlineInputBorder(),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: Row(
              children: ["699", "799", "899"]
                  .map((val) => Expanded(
                          child: GestureDetector(
                        onTap: () {
                          editingController.text = val;
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          color: Colors.grey,
                          alignment: Alignment.center,
                          child: Text(
                            val,
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      )))
                  .toList(),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              alignment: Alignment.center,
              child: Text(
                "By conducting you choose to accept Cubejek's",
                textAlign: TextAlign.center,
              )),
          Container(
              alignment: Alignment.center,
              child: Text(
                "Terms and Private Policy",
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: RoundedButton("Add Money", onPressed: () {
              if (key.currentState.validate()) {
                key.currentState.save();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardDetailsScreen()));
              }

            },color: Colors.black,),
          )
        ],
      ),
    );
  }
}
