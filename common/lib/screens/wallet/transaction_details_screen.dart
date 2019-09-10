import 'package:common/models/wallet/wallet_transcation.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class TransactionDetailsScreen extends StatefulWidget {
  final WalletTransaction transaction;

  const TransactionDetailsScreen({Key key, this.transaction}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Transcations"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeader(),
          Container(
            height: 10.0,
            color: Color(0xffeeeeee),
          ),
          _buildDetails(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: RoundedButton(
          "Need Help?",
          onPressed: () {},
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1.5)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.credit_card),
          ),
        ),
        title: Text(
          widget.transaction.orderName,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "\$ ${widget.transaction.amount}",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.transaction.success ? "Success" : "Failed",
                style: TextStyle(
                    fontSize: 14.0,
                    color:
                        widget.transaction.success ? Colors.green : Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildDetailsWidget(
              "Transcation Id", widget.transaction.transactionId),
          SizedBox(
            height: 20.0,
          ),
          _buildDetailsWidget(
              "Transcated on", widget.transaction.processedAt.toString()),
        ],
      ),
    );
  }

  Widget _buildDetailsWidget(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
