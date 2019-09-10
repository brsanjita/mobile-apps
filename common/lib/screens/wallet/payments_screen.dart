import 'package:common/models/wallet/card.dart';
import 'package:common/models/wallet/wallet.dart';
import 'package:common/screens/wallet/transaction_screen.dart';
import 'package:common/screens/wallet/wallet_screen.dart';
import 'package:common/utils/wallet_controller.dart';
import 'package:common/widgets/wallet/card_widget.dart';
import 'package:common/widgets/wallet/wallet_widget.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  final double amount;

  const PaymentMethodsScreen({Key key, this.amount}) : super(key: key);

  @override
  _PaymentMethodsScreenState createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBox) {
            return [
              SliverAppBar(
                expandedHeight: 100,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Payment"),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[getWallets(), getCreditCards()],
            ),
          )),
    );
  }

  Widget buildDivider(String label) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Color(0xffeeeeee),
      child: Text(
        label,
        style: TextStyle(fontSize: 16.0, color: Colors.black54),
      ),
    );
  }

  Widget getWallets() {
    List<Wallet> wallets = WalletController.getWallets();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildDivider("Wallet"),
        ListView.builder(
          itemBuilder: (context, index) => WalletWidget(
            wallet: wallets[index],
            onTap: () {
              if (widget.amount > wallets[index].balance) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WalletScreen()));
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          shrinkWrap: true,
          itemCount: wallets.length,
          physics: ClampingScrollPhysics(),
        )
      ],
    );
  }

  Widget getCreditCards() {
    List<CreditCard> cards = WalletController.getCards();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildDivider("CreditCard"),
        ListView.builder(
          itemBuilder: (context, index) => CreditCardWidget(
            creditCard: cards[index],
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: cards.length,
        )
      ],
    );
  }
}
