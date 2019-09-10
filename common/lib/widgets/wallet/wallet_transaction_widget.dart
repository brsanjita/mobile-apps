
import 'package:common/models/wallet/wallet_transcation.dart';
import 'package:common/screens/wallet/transaction_details_screen.dart';
import 'package:common/widgets/ease_in_widget.dart';
import 'package:flutter/material.dart';

class WalletTransactionWidget extends StatelessWidget {
  final WalletTransaction transaction;

  const WalletTransactionWidget({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
      child: EaseInWidget(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  TransactionDetailsScreen(transaction: transaction)));
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    transaction.debited ? Icons.arrow_downward : Icons.arrow_upward,
                    color: transaction.debited
                        ? Colors.redAccent
                        : Colors.lightGreenAccent,
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "₹ ${transaction.amount}",
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "${transaction.orderName}",
                        style:
                            TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "${transaction.processedAt.toUtc().toString().split(" ")[0]}",
                        style:
                            TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
